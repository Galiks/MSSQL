PRINT('���������� ��������� - ������')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * 
FROM Order_material
WHERE id_material = 5

Select * 
From Order_material
Where Cost Between 1000 and 1500 

Select id_material, Cost, id_model
FROM Order_material
Group by id_material, Cost, id_model
Having Cost > 1400
Order by Cost DESC

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('���������� ��������� - �����')

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