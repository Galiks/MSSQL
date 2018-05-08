CREATE PROCEDURE sp_clientsorder
@i int
AS
WHILE(@i < 1000)
BEGIN
SELECT C.id_client as 'Номер клиента',
C.Surname as 'Фамилия клиента',
C.[Name] as 'Имя клиента',
C.Patronymic as 'Отчество клиента',
CO.Cost as 'Цена заказа',
CO.Order_date as 'Дата заказа',
CO.Order_execution_date as 'Дата выполнения заказа'
FROM [Client's_Order] as CO
INNER JOIN Client as C ON CO.id_client=C.id_client
WHERE id_order = @i
SET @i = @i+1
END
GO

EXEC sp_clientsorder 900
GO

DROP PROCEDURE sp_clientsorder