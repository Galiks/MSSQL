USE Atelier2
GO

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_Filter --ñ âêëş÷¸ííûìè òàáëèöàìè
ON [dbo].[Order_material]([id_model], [id_material])
INCLUDE(Cost)
GO

PRINT('ÍÅÊËÀÑÒÅĞÍÛÉ Ñ ÂÊËŞ×¨ÍÍÛÌÈ ÒÀÁËÈÖÀÌÈ - ÍÀ×ÀËÎ')
SET STATISTICS IO ON;
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
GO
PRINT('ÍÅÊËÀÑÒÅĞÍÛÉ Ñ ÂÊËŞ×¨ÍÍÛÌÈ ÒÀÁËÈÖÀÌÈ - ÊÎÍÅÖ')

DROP INDEX NonCL_INDEX_Order_material_FILTER ON Order_material