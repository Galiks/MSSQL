USE Atelier2
GO

DROP VIEW FirstView
GO

CREATE VIEW FirstView WITH ENCRYPTION
AS
SELECT OM.id_order_material as '����� ������', M.Name_material as '��� ���������',P.Company_name as '��� �������������', OM.Cost as '���� ���������'
FROM Order_material as OM
JOIN Material as M ON OM.id_material = M.id_material
JOIN Provider as P ON P.id_provider = M.id_provider
GO

EXEC sp_helptext 'FirstView'
GO

SELECT *
FROM FirstView
ORDER BY [���� ���������]

DROP VIEW FirstView
GO

DROP VIEW SecondView
GO

CREATE VIEW SecondView WITH ENCRYPTION
AS
SELECT CO.id_order as '����� ������', CO.Order_date as '���� ������', CO.Order_execution_date as '���� ���������� ������',
CO.Cost as '��������� ������', C.Surname as '������� �������', EM.Surname as '������� ���������'
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
Order By [����� ������]
GO

DROP VIEW ThirdView
GO

CREATE VIEW ThirdView WITH ENCRYPTION
AS
SELECT EM.Surname as '������� ���������', EM.[Wage-rate] as '������ ���������', SP.Name_specialization as '������������� ���������' 
FROM Employee as EM
JOIN [Employee's_specialization] as ES ON ES.id_employee = EM.id_employee
JOIN Specialization as SP ON SP.id_specialization = ES.id_specialization
GO

EXEC sp_helptext 'ThirdView'
GO

SELECT *
FROM ThirdView
Order By [������ ���������]