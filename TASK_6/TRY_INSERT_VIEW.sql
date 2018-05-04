USE Atelier2
GO

DROP VIEW ThirdView_INSERT
GO

CREATE VIEW ThirdView_INSERT
AS
SELECT EM.Surname as 'Фамилия работника', EM.[Wage-rate] as 'Ставка работника',
SP.Name_specialization as 'Специализация'
FROM Employee as EM
JOIN [Employee's_specialization] as ES ON ES.id_employee = EM.id_employee
JOIN Specialization as SP ON SP.id_specialization = ES.id_specialization
WHERE EM.[Wage-rate] BETWEEN 40000 and 60000
WITH CHECK OPTION
GO

INSERT INTO ThirdView_INSERT
([Фамилия работника], [Ставка работника], Специализация)
values
('Petronov', 50000, 'Seamstree')
GO

EXEC sp_helptext 'ThirdView_UPDATE'
GO

SELECT *
FROM ThirdView_INSERT
Order by [Ставка работника]


