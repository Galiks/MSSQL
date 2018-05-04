USE Atelier2
GO

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_COLUMNS --ñ âêëþ÷¸ííûìè ñòðîêàìè
ON [dbo].[Order_material]([id_model], [id_material])
WHERE (id_material >= 20 AND id_material <= 200) AND (id_model IN (10,20,30,40,50,100,1000))

PRINT('ÍÅÊËÀÑÒÅÐÍÛÉ ÔÈËÜÒÐÎÂÀÍÍÛÉ - ÍÀ×ÀËÎ')
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
PRINT('ÍÅÊËÀÑÒÅÐÍÛÉ ÔÈËÜÒÐÎÂÀÍÍÛÉ - ÊÎÍÅÖ')

DROP INDEX NonCL_INDEX_Order_material_COLUMNS ON Order_material
