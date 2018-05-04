USE Atelier

GO
--INSERT TRIGGER
CREATE TRIGGER Insert_Order_Cost_Trigger
ON [Client's_Order]
FOR INSERT
AS
IF @@ROWCOUNT = 1
BEGIN
IF NOT EXISTS (
SELECT *
FROM inserted
WHERE inserted.Cost >= 0)
BEGIN
ROLLBACK
PRINT('ERROR! Cost cannot be less than zero')
END
END
GO
----Пример
--INSERT [Client's_Order]
--(id_client, id_measurement, id_work, Cost, Order_date, Measurement_date, Order_execution_date)
--values
--(1,1,1,-500,'2002-02-02', '2002-02-12', '2002-03-02')
CREATE TRIGGER Insert_Order_Date_Trigger
ON [Client's_Order]
FOR INSERT
AS
IF @@ROWCOUNT = 1
BEGIN
IF NOT EXISTS(
SELECT *
FROM inserted
WHERE inserted.Order_date <= ANY(
SELECT [Order_execution_date]
FROM [Client's_Order]))
BEGIN
ROLLBACK
PRINT('ERROR! Order is made earlier than accepted')
END
END
GO
--Insted of
CREATE TRIGGER Instead_of_Insert_Trigger
ON Material
INSTEAD OF INSERT
AS 
BEGIN 
DECLARE @ID_material int
DECLARE @Name_material varchar(50)
SET @ID_material = (SELECT id_material FROM inserted);
SET @Name_material = (SELECT Name_material FROM inserted); 
IF NOT EXISTS(
SELECT Name_material 
FROM inserted) 
BEGIN
INSERT INTO Material(id_material, Name_material) 
VALUES
(@ID_material, @Name_material)
END
END
GO

--UPDATE TRIGGER

CREATE TRIGGER Update_Material_Name_Trigger
ON Material
FOR UPDATE
AS
DECLARE @ID_material int
DECLARE @Name_material varchar(50)
SELECT @ID_material = i.id_material FROM inserted i;
SELECT @Name_material = i.Name_material FROM inserted i;
IF UPDATE(Name_material)
ROLLBACK
PRINT ('ERROR! Can not edit material name')
GO

----Пример
--UPDATE Material
--SET Name_material = 'Вельвет'  WHERE ID_material = '1'
--GO

CREATE TRIGGER Update_Order_Date_Trigger
ON [Client's_Order]
FOR UPDATE
AS
DECLARE @ID_order int
DECLARE @Date_of_order date
SELECT @ID_order = i.id_order FROM inserted i;
SELECT @Date_of_order = i.Order_date FROM inserted i;
IF UPDATE(Order_date)
ROLLBACK
PRINT ('ERROR! It is not possible to change the date when the order was placed')
GO

--Insted of
CREATE TRIGGER Instead_of_Update_Trigger
ON [Client's_Order]
INSTEAD OF UPDATE
AS
BEGIN 
DECLARE @ID_order int
DECLARE @ID_client int
DECLARE @ID_measurement int
DECLARE @ID_work int
DECLARE @COST money
DECLARE @ORDER_DATE date
DECLARE @MEASUREMENT_DATE date
DECLARE @ORDER_EXECUTION_DATE date
DECLARE @ID_discount int

DECLARE @ID_material int

SET @ID_order = (SELECT id_order FROM inserted);
SET @ID_client = (SELECT id_client FROM inserted);
SET @ID_measurement = (SELECT id_measurement FROM inserted);
SET @ID_work = (SELECT id_work FROM inserted);
SET @COST = (SELECT Cost FROM inserted);
SET @ORDER_DATE = (SELECT Order_date FROM inserted);
SET @MEASUREMENT_DATE = (SELECT Measurement_date FROM inserted);
SET @ORDER_EXECUTION_DATE = (SELECT Order_execution_date FROM inserted);
SET @ID_discount = (SELECT id_discount FROM inserted);

SET @ID_material = (SELECT id_material FROM Material);

IF UPDATE (Cost)
BEGIN
UPDATE [Client's_Order]
SET Cost = @COST WHERE id_order = @ID_order
UPDATE Order_material
SET Cost = (
SELECT Quantity_goods
FROM Material
WHERE id_material = @ID_material) * 
(SELECT Cost_per_unit
FROM Material
WHERE id_material = @ID_material)
END
END
GO


--DELETE TRIGGER

CREATE TRIGGER Delete_Material_Provider_Trigger
ON Material
FOR DELETE
AS
BEGIN
IF NOT EXISTS (
SELECT * 
FROM deleted INNER JOIN Material ON deleted.id_provider = Material.id_provider)
ROLLBACK
PRINT ('ERROR! Prohibit the removal of a provider')
RETURN
END
GO

CREATE TRIGGER Delete_Material_Trigger
ON Material
FOR DELETE
AS
BEGIN
IF NOT EXISTS (
SELECT * 
FROM deleted INNER JOIN Material ON deleted.Cost_per_unit = Material.Cost_per_unit)
ROLLBACK
PRINT ('ERROR! Prohibition on removal of material cost')
RETURN
END
GO

--Insted of
CREATE TRIGGER Instead_of_Delete_Trigger
ON [Provider]
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (
SELECT * 
FROM DELETED
INNER JOIN Material on Material.id_provider = DELETED.id_provider
)
BEGIN
DELETE FROM Material
WHERE Material.id_provider = (SELECT id_provider FROM DELETED)
DELETE FROM [Provider]
WHERE [Provider].id_provider = (SELECT id_provider FROM DELETED)
END
END;
GO