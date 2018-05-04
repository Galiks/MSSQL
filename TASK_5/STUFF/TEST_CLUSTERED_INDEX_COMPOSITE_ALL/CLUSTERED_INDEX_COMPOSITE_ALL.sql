DROP INDEX CL_INDEX_ALL_Order_material_COMPOSITE ON Order_material

CREATE CLUSTERED INDEX CL_INDEX_ALL_Order_material_COMPOSITE --янярюбмни
ON [dbo].[Order_material]([id_order_material], [id_model], [Cost], [id_material])

PRINT('йкюярепмши янярюбмни - мювюкн')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * 
FROM Order_material
WHERE id_material = 5

Select * 
From Order_material
Where Cost Between 1000 and 1500 

--Select id_material, Cost, id_model
--FROM Order_material
--Group by id_material, Cost, id_model
--Having Cost > 1400
--Order by Cost DESC

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('йкюярепмши янярюбмни - йнмеж')

DROP INDEX CL_INDEX_ALL_Order_material_COMPOSITE ON Order_material

