USE Atelier2
GO

DROP INDEX CL_INDEX_Order_material_COMPOSITE ON Order_material

CREATE CLUSTERED INDEX CL_INDEX_Order_material_COMPOSITE --���������
ON [dbo].[Order_material]([Cost], [id_material])

PRINT('���������� ��������� - ������')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * 
FROM Order_material
WHERE id_material = 5

Select * 
From Order_material
Where Cost Between 1000 and 1500 

Select id_material, Cost
FROM Order_material
Group by id_material, Cost
Having Cost > 1400
Order by Cost DESC

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('���������� ��������� - �����')

DROP INDEX CL_INDEX_Order_material_COMPOSITE ON Order_material

DROP INDEX CL_INDEX_Order_material on Order_material

create clustered index CL_INDEX_Order_material --����������
ON [dbo].[Order_material]([id_material])

PRINT('���������� ���������� - ������')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * 
FROM Order_material
WHERE id_material = 5

Select * 
From Order_material
Where Cost Between 1000 and 1500 

Select id_material, Cost
FROM Order_material
Group by id_material, Cost
Having Cost > 1400
Order by Cost DESC

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('���������� ���������� - �����')

DROP INDEX CL_INDEX_Order_material on Order_material