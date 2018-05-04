USE Atelier2
GO

CREATE VIEW ThirdView_UPDATE
AS
SELECT EM.Surname as '������� ���������', EM.[Wage-rate] as '������ ���������'
FROM Employee as EM
WITH CHECK OPTION
GO

update ThirdView_UPDATE 
SET [������� ���������] = 'Smith',
[������ ���������] = '15000'
WHERE [������ ���������] < 15000
GO

EXEC sp_helptext 'ThirdView_UPDATE'
GO

SELECT *
FROM ThirdView_UPDATE
Order by [������ ���������]

DROP VIEW ThirdView_UPDATE
GO

CREATE VIEW ThirdView_INSERT
AS
SELECT SP.Name_specialization
FROM Specialization as SP
WITH CHECK OPTION
GO

EXEC sp_helptext 'ThirdView_INSERT'
GO

INSERT INTO ThirdView_INSERT
values
('����������')
GO

DROP VIEW ThirdView_INSERT 