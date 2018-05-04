USE Atelier2
GO

DROP VIEW FirstView
GO

CREATE VIEW FirstView WITH ENCRYPTION
AS
SELECT OM.id_order_material as 'Номер заказа', M.Name_material as 'Имя материала',P.Company_name as 'Имя производителя', OM.Cost as 'Цена материала'
FROM Order_material as OM
JOIN Material as M ON OM.id_material = M.id_material
JOIN Provider as P ON P.id_provider = M.id_provider
GO

EXEC sp_helptext 'FirstView'
GO

SELECT *
FROM FirstView
ORDER BY [Цена материала]

DROP VIEW FirstView
GO

DROP VIEW SecondView
GO

CREATE VIEW SecondView WITH ENCRYPTION
AS
SELECT CO.id_order as 'Номер заказа', CO.Order_date as 'Дата заказа', CO.Order_execution_date as 'Дата выполнения заказа',
CO.Cost as 'Стоимость заказа', C.Surname as 'Фамилия клиента', EM.Surname as 'Фамилия работника'
FROM [Client's_Order] as CO
JOIN Client as C ON C.id_client = CO.id_client
JOIN Type_of_work as TW ON TW.id_work = CO.id_work
JOIN Employee as EM ON TW.id_employee = EM.id_employee
GO

EXEC sp_helptext 'SecondView'
GO

print('SecondView')
Select *
FROM SecondView
Order By [Номер заказа]
GO

DROP VIEW ThirdView
GO

CREATE VIEW ThirdView WITH ENCRYPTION
AS
SELECT EM.Surname as 'Фамилия работника', EM.[Wage-rate] as 'Ставка работника', SP.Name_specialization as 'Специализация работника' 
FROM Employee as EM
JOIN [Employee's_specialization] as ES ON ES.id_employee = EM.id_employee
JOIN Specialization as SP ON SP.id_specialization = ES.id_specialization
GO

EXEC sp_helptext 'ThirdView'
GO

SELECT *
FROM ThirdView
Order By [Ставка работника]