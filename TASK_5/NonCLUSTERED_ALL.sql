USE Atelier2
GO

DROP INDEX NonCL_INDEX_Order_material_COVERING ON Order_material

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_COVERING --������������
ON [dbo].[Order_material]([id_model],[id_material],[Cost])

PRINT('������������ ����������� - ������')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT CM.[Name of model], M.Name_material, OM.Cost
FROM (Order_material as OM
INNER JOIN Clothing_model as CM ON OM.id_model = CM.id_model) 
INNER JOIN Material as M ON OM.id_material = M.id_material 
ORDER BY Cost DESC

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('������������ ����������� - �����')

DROP INDEX NonCL_INDEX_Order_material_COVERING ON Order_material

DROP INDEX NonCL_INDEX_Order_material_COLUMNS ON Order_material

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_COLUMNS --� ������������
ON [dbo].[Order_material]([id_model], [id_material])
WHERE (id_material >= 20 AND id_material <= 200) AND (id_model IN (10,20,30,40,50,100,1000))

PRINT('������������ ����������� - ������')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM Order_material as OM
JOIN Material as M ON OM.id_material = M.id_material

SELECT CM.[Name of model], M.Name_material, OM.id_material
FROM (Order_material as OM
INNER JOIN Clothing_model as CM ON OM.id_model = CM.id_model) 
INNER JOIN Material as M ON OM.id_material = M.id_material
WHERE CM.[Name of model] LIKE 'A%'  

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('������������ ����������� - �����')

DROP INDEX NonCL_INDEX_Order_material_COLUMNS ON Order_material

DROP INDEX NonCL_INDEX_Order_material_FILTER ON Order_material

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_Filter --� ����������� ���������
ON [dbo].[Order_material]([id_model], [id_material])
INCLUDE(Cost)

PRINT('������������ � ����ר����� ��������� - ������')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM Order_material as OM
JOIN Material as M ON OM.id_material = M.id_material

SELECT CM.[Name of model], M.Name_material, OM.id_material
FROM (Order_material as OM
INNER JOIN Clothing_model as CM ON OM.id_model = CM.id_model) 
INNER JOIN Material as M ON OM.id_material = M.id_material
WHERE CM.[Name of model] LIKE 'A%'
PRINT('������������ � ����ר����� ��������� - �����')