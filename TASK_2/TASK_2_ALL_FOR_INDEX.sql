USE master 
GO 

IF EXISTS(SELECT * FROM sys.databases WHERE name='Atelier2') 
BEGIN 
DROP DATABASE Atelier2
END 
GO 

CREATE DATABASE Atelier2
GO 

USE Atelier2
GO

CREATE TABLE [Client's_Order] ( --Заказ клиента
	[id_order] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Client's_Order] primary key, --номер заказа
	[id_client] int NOT NULL, --номер клиента
	[id_measurement] int NOT NULL, --номер замерки
	[id_work] int NOT NULL, --номер работы
	[Cost] money NOT NULL, --стоимость
	[Order_date] date NOT NULL, --дата заказа
	[Measurement_date] date NOT NULL, --дата замерки
	[Order_execution_date] date NOT NULL, --дата выполнения заказа
	[id_discount] int, --номер скидки
);

CREATE TABLE [Client] ( --клиент
	[id_client] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Client primary key, --номер клиента
	[Surname] varchar(50) NOT NULL, --фамилия клиента
	[Name] varchar(50) NOT NULL, --имя клиента
	[Patronymic] varchar(50) NOT NULL, --отчество клиента
	[Phone] varchar(50) NOT NULL, --телефон клиента
);

CREATE TABLE [Client's_Size] ( --размеры клиента
	[id_measurement] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Client's_Size] primary key, --номер замерки
	[Chest_girth] float, --обхват груди
	[Head_girth] float, --обхват головы
	[Waist_girth] float, --обхват талии
	[Hip_girth] float, --обхват бёдер
	[Shoe_size] float, --размер обуви
	[Date_taking_measurement] date NOT NULL, --дата снятия мерок
);

CREATE TABLE [Clothing_model] ( --модель одежды
	[id_model] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Clothing_model] primary key, --номер модели
	[Name of model] varchar(50) NOT NULL, --название модели
	[Cost] money NOT NULL, --стоимость модели
	[Required_quantity_material] int NOT NULL, --требуемое количество материала
);

CREATE TABLE [Order_material] ( --заказ материала
	[id_order_material] int IDENTITY(1,1) NOT NULL, --номер заказа материала
	[id_model] int NOT NULL, --номер модели
	[id_material] int NOT NULL, --номер материала
	[Cost] money NOT NULL, --стоимость
);

CREATE TABLE [Material] ( --материал
	[id_material] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Material primary key, --номер материала
	[id_provider] int NOT NULL, --номер поставщика
	[Cost_per_unit] money NOT NULL, --цена за единицу
	[Quantity_goods] int NOT NULL, --количество материала
	[Name_material] varchar(50) NOT NULL, --название материала
);

CREATE TABLE [Provider] ( --поставщик
	[id_provider] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Provider primary key, --номер поставщика
	[Company_name] varchar(50) NOT NULL, --название компании
	[Phone] varchar(50) NOT NULL, --номер телефона
);

CREATE TABLE [Employee] ( --работник
	[id_employee] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Employee primary key, --номер работника
	[Surname] varchar(50) NOT NULL, --фамилия
	[Name] varchar(50) NOT NULL, --имя
	[Patronymic] varchar(50) NOT NULL, --отчество
	[Phone] varchar(50) NOT NULL, --телефон
	[Wage-rate] money NOT NULL, --ставка
	[SNILS] varchar(11) NOT NULL UNIQUE, --СНИЛС
	[INN] varchar(12) NOT NULL UNIQUE, --ИНН
);

CREATE TABLE [Comment] ( --отзыв
	[id_comment] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Comment primary key, --номер отзыва
	[id_client] int NOT NULL, --номер клиента
	[id_employee] int NOT NULL, --номер работника
	[Quality_work] int NOT NULL, --качество работы
);

CREATE TABLE [Type_of_work] ( --вид работы
	[id_work] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Type_of_work] primary key, --номер работы
	[id_employee] int NOT NULL, --номер работника
	[id_model] int NOT NULL, --номер модели
	[Term_of_work] date NOT NULL, --срок работы
);

CREATE TABLE [Discount] ( --скидка
	[id_discount] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Discount primary key, --номер скидки
	[Amount_discount] float NOT NULL, --размер скидки
	[Start_discount] datetime, --дата начала действия скидки
	[End_discount] datetime, --дата окончания действия скидки
);

CREATE TABLE [Employee's_specialization] ( --специализация работника
	[id] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Employee's_specialization] primary key, --номер соотношения специализации и работника
	[id_employee] int NOT NULL, --номер работника
	[id_specialization] int NOT NULL, --номер специализации
);

CREATE TABLE [Specialization] ( --специализация
	[id_specialization] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Specialization primary key, --номер специализации
	[Name_specialization] varchar(50) NOT NULL, --название специализации
);


ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Order_Client_] --1
FOREIGN KEY ([id_client]) references [Client]([id_client])
on delete no action

ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Client's_Size] --2
FOREIGN KEY ([id_measurement]) references [Client's_Size]([id_measurement])
on delete no action

ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Type_of_work] --3
FOREIGN KEY ([id_work]) references [Type_of_work]([id_work])
on delete no action

ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Discount] --4
FOREIGN KEY ([id_discount]) references [Discount]([id_discount])
on delete no action

ALTER TABLE [Order_material] ADD CONSTRAINT [FK_Order_material_Clothing_model] --1
FOREIGN KEY ([id_model]) references [Clothing_model]([id_model])
on delete no action

ALTER TABLE [Order_material] ADD CONSTRAINT [FK_Order_material_Material] --2
FOREIGN KEY ([id_material]) references [Material]([id_material])
on delete no action

ALTER TABLE [Material] ADD CONSTRAINT [FK_Material_Provider] --1
FOREIGN KEY ([id_provider]) references [Provider]([id_provider])
on delete no action

ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comment_Client] --1
FOREIGN KEY ([id_client]) references [Client]([id_client])
on delete no action

ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comment_Employee] --2
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Type_of_work] ADD CONSTRAINT [FK_Type_of_work_Employee] --1
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Type_of_work] ADD CONSTRAINT [FK_Type_of_work_Clothing_model] --2
FOREIGN KEY ([id_model]) references [Clothing_model]([id_model])
on delete no action

ALTER TABLE [Employee's_specialization] ADD CONSTRAINT [FK_Employee's_specialization_Employee] --1
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Employee's_specialization] ADD CONSTRAINT [FK_Employee's_specialization_Specialization] --2
FOREIGN KEY ([id_specialization]) references [Specialization]([id_specialization])
on delete no action

GO

-----размеры клиента
--INSERT [Client's_Size]
--(Head_girth, Date_taking_measurement)
-- values
--('56', '2017-08-12')

--INSERT [Client's_Size]
--(Shoe_size, Date_taking_measurement)
--values
--('42', '2017-10-05')

--INSERT [Client's_Size]
--(Chest_girth, Waist_girth, Hip_girth, Date_taking_measurement)
--values
--('90', '60', '90', '2017-11-30')

----клиент
--INSERT [Client]
--(Surname, Name, Patronymic, Phone)
-- values
--('Семиврагов', 'Александр', 'Алексеевич', '89172054876'),
--('Феофанов', 'Никита', 'Андреевич', '89265487896')

--INSERT [Specialization]
--(Name_specialization)
--values
--('Дизайнер'),
--('Технолог'),
--('Конструктор'),
--('Швея'),
--('Закройщик')

--INSERT [Employee]
--(Surname, Name, Patronymic, Phone, [Wage-rate], SNILS, INN)
--values
--('Иванов', 'Иван', 'Иванович', '89472226655', '15000', '45698213654', '159753684265'),
--('Петров', 'Пётр', 'Петрович', '89465263214', '20000', '56974516597', '154786523215'),
--('Смирнов', 'Алексей', 'Степанович', '89264586547', '17000', '1111111111', '222222222222'),
--('Новогоднев', 'Семён', 'Андреевич', '89175455644', '19000', '52698745152', '465231987454'),
--('Чередников', 'Илья', 'Эдуардович', '89602545566', '18000', '41253698745', '562148932545'),
--('Андреев', 'Павел', 'Артёмович', '87855556985', '14000', '58964235874', '453215896541')

--INSERT [Provider]
--(Company_name, Phone)
--values
--('Наша компания', '456585'),
--('Материалист', '698547'),
--('Хозяин-барин', '152987')

--INSERT [Material]
--(id_provider, Cost_per_unit, Quantity_goods, Name_material)
--values
--('1', '2000', '10', 'Шёлк'),
--('3', '1000', '15', 'Бязь')

--INSERT [Client]
--(Surname, Name, Patronymic, Phone)
-- values
--('Кривоножкин', 'Александр', 'Михайлович', '89372204031')

--INSERT [Employee's_specialization]
--(id_employee, id_specialization)
--values
--('1', '1'),
--('2', '3'),
--('3', '5'),
--('4', '4'),
--('5', '2'),
--('6', '1'),
--('6', '2'),
--('6', '3')

--INSERT [Comment]
--(id_client, id_employee, Quality_work)
--values
--('1', '4', '10')

--INSERT [Clothing_model]
--([Name of model], Cost, Required_quantity_material)
--values
--('Шляпа', '1000', '20'),
--('Платье', '15000', '50'),
--('Туфли', '9000', '45')

--/*INSERT [Discount]
--(Amount_discount, Start_discount, End_discount)
--values
--('15', '2018-01-01', '2018-02-22')*/

--INSERT [Discount]
--(Amount_discount)
--values
--('80')

--INSERT [Type_of_work]
--(id_employee, id_model, Term_of_work)
--values
--('6', '2', '2018-03-09')

--INSERT [Client's_Order]
--(id_client, id_measurement, id_work, Cost, Order_date, Measurement_date, Order_execution_date, id_discount)
--values
--('3', '1', '1', '1000', '2017-07-10', '2017-09-20', '2018-03-09', '1')

--INSERT [Order_material]
--(id_model, id_material, Cost)
--values
--('2', '1', '10'),
--('3', '2', '30')


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
WHERE id_material = @ID_material) * (
SELECT Cost_per_unit
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
