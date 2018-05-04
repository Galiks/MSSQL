CREATE TABLE [Client's Order] (
	[id_order] int IDENTITY(1,1) NOT NULL primary key,
	[id_client] int NOT NULL,
	[id_measurement] int NOT NULL,
	[id_work] int NOT NULL,
	Cost money NOT NULL,
	[Order date] date NOT NULL,
	[Measurement date] date NOT NULL,
	[Order_execution_date] date NOT NULL,
	[id_discount] int,
);

CREATE TABLE [Client] (
	[id_client] int IDENTITY(1,1) NOT NULL primary key,
	Surname varchar NOT NULL,
	Имя varchar NOT NULL,
	Отчество varchar NOT NULL,
	Телефон varchar NOT NULL,
  CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED
  (
  [№ клиента] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Размеры клиента] (
	[№ замерки] integer NOT NULL UNIQUE,
	[Обхват груди] float,
	[Обхват головы] float,
	[Обхват талии] float,
	[Обхват бёдер] float,
	[Размер обуви] float,
	[Дата снятия мерок] date NOT NULL,
  CONSTRAINT [PK_Размеры клиента] PRIMARY KEY CLUSTERED
  (
  [№ замерки] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Модель одежды] (
	[№ модели] integer NOT NULL UNIQUE,
	[Наименование модели] varchar NOT NULL,
	[Стоимость модели] money NOT NULL,
	[Требуемое количество материала] integer NOT NULL,
  CONSTRAINT [PK_Модель одежды] PRIMARY KEY CLUSTERED
  (
  [№ модели] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Заказ материала] (
	[№ заказа материала] integer NOT NULL,
	[№ модели] integer NOT NULL UNIQUE,
	[№ материала] integer NOT NULL UNIQUE,
	[Количество товара] integer NOT NULL,
	Стоимость money NOT NULL,
  CONSTRAINT [PK_Заказ материала] PRIMARY KEY CLUSTERED
  (
  [№ заказа материала] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Материал] (
	[№ материала] integer NOT NULL UNIQUE,
	[№ поставщика] integer NOT NULL UNIQUE,
	[Стоимость за единицу] money NOT NULL,
  CONSTRAINT [PK_Материал] PRIMARY KEY CLUSTERED
  (
  [№ материала] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Поставщик] (
	[№ поставщика] integer NOT NULL,
	[Название компании] varchar NOT NULL,
	Телефон varchar NOT NULL,
  CONSTRAINT [PK_Поставщик] PRIMARY KEY CLUSTERED
  (
  [№ поставщика] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Работник] (
	[№ работника] integer NOT NULL,
	Фамилия varchar NOT NULL,
	Имя varchar NOT NULL,
	Отчество varchar NOT NULL,
	Телефон varchar NOT NULL,
	Специализация varchar NOT NULL,
	Ставка money NOT NULL,
	СНИЛС varchar NOT NULL UNIQUE,
	ИНН varchar NOT NULL UNIQUE,
  CONSTRAINT [PK_Работник] PRIMARY KEY CLUSTERED
  (
  [№ работника] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Отзыв] (
	[№ отзыва] integer NOT NULL UNIQUE,
	[№ клиента] integer NOT NULL UNIQUE,
	[№ работника] integer NOT NULL UNIQUE,
	[Качество работы] integer NOT NULL,
  CONSTRAINT [PK_Отзыв] PRIMARY KEY CLUSTERED
  (
  [№ отзыва] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Вид работы] (
	[№ работы] integer NOT NULL,
	[№ работника] integer NOT NULL,
	[№ модели] integer NOT NULL,
	[Срок работы] datetime NOT NULL,
  CONSTRAINT [PK_Вид работы] PRIMARY KEY CLUSTERED
  (
  [№ работы] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Скидки] (
	[№ скидки] integer NOT NULL,
	[Размер скидки] float NOT NULL,
	[Начало действия скидки] datetime,
	[Конец действия скидки] datetime,
  CONSTRAINT [PK_Скидки] PRIMARY KEY CLUSTERED
  (
  [№ скидки] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Специализация работника] (
	id integer NOT NULL,
	[№ работника] integer NOT NULL,
	[№ специализации] integer NOT NULL,
  CONSTRAINT [PK_Специализация работника] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Специализация] (
	[№ специализации] integer NOT NULL,
	[Название специализации] varchar NOT NULL,
  CONSTRAINT [PK_Специализация] PRIMARY KEY CLUSTERED
  (
  [№ специализации] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk0] FOREIGN KEY ([№ клиента]) REFERENCES [Клиент]([№ клиента])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk0]
GO
ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk1] FOREIGN KEY ([№ замерки]) REFERENCES [Размеры клиента]([№ замерки])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk1]
GO
ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk2] FOREIGN KEY ([№ работы]) REFERENCES [Вид работы]([№ работы])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk2]
GO
ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk3] FOREIGN KEY ([№ скидки]) REFERENCES [Скидки]([№ скидки])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk3]
GO


ALTER TABLE [Заказ материала] WITH CHECK ADD CONSTRAINT [Заказ материала_fk0] FOREIGN KEY ([№ модели]) REFERENCES [Модель одежды]([№ модели])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ материала] CHECK CONSTRAINT [Заказ материала_fk0]
GO
ALTER TABLE [Заказ материала] WITH CHECK ADD CONSTRAINT [Заказ материала_fk1] FOREIGN KEY ([№ материала]) REFERENCES [Материал]([№ материала])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ материала] CHECK CONSTRAINT [Заказ материала_fk1]
GO

ALTER TABLE [Материал] WITH CHECK ADD CONSTRAINT [Материал_fk0] FOREIGN KEY ([№ поставщика]) REFERENCES [Поставщик]([№ поставщика])
ON UPDATE CASCADE
GO
ALTER TABLE [Материал] CHECK CONSTRAINT [Материал_fk0]
GO



ALTER TABLE [Отзыв] WITH CHECK ADD CONSTRAINT [Отзыв_fk0] FOREIGN KEY ([№ клиента]) REFERENCES [Клиент]([№ клиента])
ON UPDATE CASCADE
GO
ALTER TABLE [Отзыв] CHECK CONSTRAINT [Отзыв_fk0]
GO
ALTER TABLE [Отзыв] WITH CHECK ADD CONSTRAINT [Отзыв_fk1] FOREIGN KEY ([№ работника]) REFERENCES [Работник]([№ работника])
ON UPDATE CASCADE
GO
ALTER TABLE [Отзыв] CHECK CONSTRAINT [Отзыв_fk1]
GO

ALTER TABLE [Вид работы] WITH CHECK ADD CONSTRAINT [Вид работы_fk0] FOREIGN KEY ([№ работника]) REFERENCES [Работник]([№ работника])
ON UPDATE CASCADE
GO
ALTER TABLE [Вид работы] CHECK CONSTRAINT [Вид работы_fk0]
GO
ALTER TABLE [Вид работы] WITH CHECK ADD CONSTRAINT [Вид работы_fk1] FOREIGN KEY ([№ модели]) REFERENCES [Модель одежды]([№ модели])
ON UPDATE CASCADE
GO
ALTER TABLE [Вид работы] CHECK CONSTRAINT [Вид работы_fk1]
GO


ALTER TABLE [Специализация работника] WITH CHECK ADD CONSTRAINT [Специализация работника_fk0] FOREIGN KEY ([№ работника]) REFERENCES [Работник]([№ работника])
ON UPDATE CASCADE
GO
ALTER TABLE [Специализация работника] CHECK CONSTRAINT [Специализация работника_fk0]
GO
ALTER TABLE [Специализация работника] WITH CHECK ADD CONSTRAINT [Специализация работника_fk1] FOREIGN KEY ([№ специализации]) REFERENCES [Специализация]([№ специализации])
ON UPDATE CASCADE
GO
ALTER TABLE [Специализация работника] CHECK CONSTRAINT [Специализация работника_fk1]
GO


