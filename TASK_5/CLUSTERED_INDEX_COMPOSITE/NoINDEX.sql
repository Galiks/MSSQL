PRINT('йкюярепмши янярюбмни - мювюкн')
--SET STATISTICS IO ON;
SET STATISTICS TIME ON;

print('1')
SELECT Cost, id_material 
FROM Order_material
WHERE id_material < 1001

print('2')
Select Cost, id_material
From Order_material
Where Cost Between 10 and 19000

print('3')
Select id_material, Cost, id_order_material
FROM Order_material
Group by id_material, Cost, id_order_material
Having Cost > 1400 AND id_order_material > 10
Order by Cost DESC


PRINT('йкюярепмши янярюбмни - йнмеж')