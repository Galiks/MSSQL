USE Atelier;
GO

--INNER JOIN
SELECT client.Surname, size.Date_taking_measurement
FROM Client AS client
    INNER JOIN [Client's_Size] AS size
    ON client.id_client = size.id_measurement
	ORDER BY Date_taking_measurement DESC
GO

--OUTER JOIN
SELECT client.Surname AS Client, size.Surname AS Employee
FROM Client client
FULL OUTER JOIN Employee size --всё
ON client.id_client = size.id_employee
GO

SELECT client.Surname AS Client, size.Surname AS Employee
FROM Client client
LEFT JOIN Employee size --левый столбец
ON client.id_client = size.id_employee
GO

SELECT client.Surname AS Client, size.Surname AS Employee
FROM Client client
RIGHT OUTER JOIN Employee size --правый столбец
ON client.id_client = size.id_employee
GO

SELECT client.Surname, size.Date_taking_measurement
FROM Client client
LEFT JOIN [Client's_Size] size --левый столбец
ON client.id_client = size.Head_girth
GO

SELECT client.Surname, size.Date_taking_measurement
FROM Client client
RIGHT OUTER JOIN [Client's_Size] size --правый столбец
ON client.id_client = size.Head_girth
GO

--Cross join
SELECT client.Surname, size.Date_taking_measurement
FROM Client client
CROSS JOIN [Client's_Size] size
ORDER BY client.Surname
GO

--Cross apply
SELECT order_material.Cost, order_material.Quantity_goods
FROM Order_material [order_material]
CROSS APPLY 
(SELECT p.Company_name
FROM Provider p 
WHERE order_material.Cost < 100000) p
GO

--самосоединение
SELECT [order].Measurement_date, client.Surname
FROM [Client's_Order] [order]
JOIN Client client
ON [order].id_client = client.id_client
ORDER BY [order].Cost
GO

--IN
SELECT *
FROM Employee
WHERE id_employee IN (1,3)

--LIKE
SELECT *
FROM Client
WHERE [Name] LIKE 'А%'
GO

--BETWEEN
SELECT *
FROM Material
WHERE Cost_per_unit BETWEEN 500 AND 1500
GO

--ALL, ANY, GROUP BY, HAVING
SELECT Name_material, Cost_per_unit
FROM Material
GROUP BY Cost_per_unit, Name_material
HAVING MAX (Cost_per_unit) <= ALL( --ALL or ANY
Select Material.Cost_per_unit
FROM Material
WHERE Cost_per_unit > 0)
GO

SELECT Surname AS 'Фамилия', [Wage-rate] AS 'Оклад', [Name of model] AS 'Модель'
FROM Employee, Clothing_model
JOIN Type_of_work ON (Type_of_work.id_employee = id_employee AND Type_of_work.id_model = Clothing_model.id_model)
GROUP BY [Wage-rate], [Name of model], Surname


--CASE
SELECT Cost_per_unit, 'Price of material' =
	CASE 
		WHEN Material.Cost_per_unit = 1000 THEN 'Бязь'
		WHEN Material.Cost_per_unit = 2000 THEN 'Шёлк'
		ELSE 'NULL'
	END
FROM Material
ORDER BY Cost_per_unit DESC
GO

--CAST, CONVERT
SELECT Cost_per_unit, Name_material
FROM Material
WHERE CAST(Cost_per_unit AS int) LIKE '%'
GO
SELECT Cost_per_unit, Name_material
FROM Material
WHERE CONVERT(int, Cost_per_unit) LIKE '%'
GO

--NULL
Select id_measurement, Head_girth
FROM [Client's_Size]
WHERE Head_girth > 5 OR Head_girth IS NULL
GO

--COALESCE
SELECT Chest_girth, id_measurement,
COALESCE(Chest_girth, id_measurement) AS FirstNotNull  
FROM [Client's_Size] size 
GO

--REPLACE
SELECT REPLACE([Provider].Company_name, 'а', 'А')
FROM [Provider]
GO

--STUFF
SELECT STUFF(Company_name, 2,5, 'FFFFFFFFFFFFF')
FROM [Provider]
GO

--DATEPART
SELECT *, DATEPART(YEAR, Order_date)
FROM [Client's_Order]
GO

--DATEDIFF разница между датами
SELECT DATEDIFF(DAY, Order_date, Order_execution_date)
FROM [Client's_Order]
GO