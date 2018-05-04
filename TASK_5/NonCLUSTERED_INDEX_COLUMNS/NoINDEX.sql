USE Atelier2
GO

PRINT('мейкюярепмши я бйкчв╗ммшлх рюакхжюлх - мювюкн')
--SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM Order_material as OM
JOIN Material as M ON OM.id_material = M.id_material
GO

SELECT CM.[Name of model], M.Name_material, OM.id_material
FROM (Order_material as OM
INNER JOIN Clothing_model as CM ON OM.id_model = CM.id_model) 
INNER JOIN Material as M ON OM.id_material = M.id_material
WHERE CM.[Name of model] LIKE 'A%'

PRINT('мейкюярепмши я бйкчв╗ммшлх рюакхжюлх - йнмеж')