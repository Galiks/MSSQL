USE Atelier2
GO

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_COVERING --онйпшбшючыхи
ON [dbo].[Order_material]([id_model],[id_material],[Cost])

PRINT('мейкюярепмши онйпшбючыхи - мювюкн')
--SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM Order_material
GO

SELECT CM.[Name of model], M.Name_material, OM.Cost
FROM (Order_material as OM
INNER JOIN Clothing_model as CM ON OM.id_model = CM.id_model) 
INNER JOIN Material as M ON OM.id_material = M.id_material 
ORDER BY Cost DESC

PRINT('мейкюярепмши онйпшбючыхи - йнмеж')

DROP INDEX NonCL_INDEX_Order_material_COVERING ON Order_material