USE Atelier2
GO

--usual
Create proc sp_material @Material_name varchar(50)
AS
SELECT @Material_name = RTRIM(@Material_name) + '%'; 
SELECT OM.id_order_material as 'Номер заказа',
OM.Cost as 'Цена заказа',
M.Name_material as 'Имя материала',
P.Company_name as 'Имя компании'
FROM Material as M JOIN Order_material as OM ON OM.id_material = M.id_material
JOIN Provider as P ON P.id_provider = M.id_provider
WHERE M.Name_material LIKE @Material_name
ORDER BY OM.id_order_material
GO
EXEC sp_material @Material_name = 'Ab'
GO
DROP PROCEDURE sp_material
GO

CREATE PROCEDURE sp_comment 
@Surname_Employee varchar(50)
AS
SELECT @Surname_Employee = RTRIM(@Surname_Employee) + '%'; 
SELECT E.Surname as 'Фамилия работника', 
S.Name_specialization as 'Специализация работника',
C.Quality_work as 'Качество работы'
FROM Comment as C
INNER JOIN Employee as E ON E.id_employee=C.id_employee
INNER JOIN [Employee's_specialization] as ES ON ES.id_employee = E.id_employee
INNER JOIN Specialization as S ON S.id_specialization = ES.id_specialization
WHERE E.Surname LIKE @Surname_Employee
ORDER BY C.Quality_work
GO
EXEC sp_comment @Surname_Employee = 'B'
GO
DROP PROCEDURE sp_comment
GO

--output
Create proc sp_ordercount
@begin_date date,
@end_date date,
@sum int output
AS
SELECT @sum = COUNT(CO.id_order)
FROM [Client's_Order] as CO
WHERE CO.Order_execution_date >= @begin_date AND CO.Order_execution_date <= @end_date
GO
DECLARE @temp int
EXEC sp_ordercount '1970-01-01', '1970-01-02', @temp output
SELECT @temp
GO
DROP PROCEDURE sp_ordercount