USE Atelier2
GO

create clustered index CL_INDEX_Order_material --óíèêàëüíûé
ON [dbo].[Order_material]([id_material])

PRINT('ÊËÀÑÒÅĞÍÛÉ ÓÍÈÊÀËÜÍÛÉ - ÍÀ×ÀËÎ')
--SET STATISTICS IO ON;
SET STATISTICS TIME ON;

PRINT('1')
SELECT id_material 
FROM Order_material
--WHERE id_material < 1000
GO

PRINT('2')
Select * 
From Order_material
Where Cost Between 10 and 18000 
GO

PRINT('3')
Select id_material, Cost
FROM Order_material
Group by id_material, Cost
Having id_material > 10 AND Cost > 10
Order by Cost DESC
GO

PRINT('ÊËÀÑÒÅĞÍÛÉ ÓÍÈÊÀËÜÍÛÉ - ÊÎÍÅÖ')

DROP INDEX CL_INDEX_Order_material on Order_material