USE Atelier2
GO

CREATE INDEX CL_INDEX_Order_material_FILTER --фильрующий
ON [dbo].[Order_material]([id_material], [Cost])
WHERE (id_material >= 20 AND id_material <= 200) AND (Cost > 3000)

SET STATISTICS TIME ON;

Select Cost, id_material
From Order_material
Where Cost Between 10 and 19000 

SET STATISTICS TIME OFF;

DROP INDEX CL_INDEX_Order_material_FILTER ON Order_material