CREATE TABLE [Client's_Order] ( --Заказ клиента
	[id_order] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Client's_Order] primary key, --номер заказа
	[id_client] int NOT NULL, --номер клиента
	[id_measurement] int NOT NULL, --номер замерки
	[id_work] int NOT NULL, --номер работы
	[Cost] money NOT NULL, --стоимость
	[Order_date] date NOT NULL, --дата заказа
	[Measurement_date] date NOT NULL, --дата замерки
	[Order_execution_date] date NOT NULL, --дата выполнения заказа
	[id_discount] int, --номер скидки
);

CREATE TABLE [Client] ( --клиент
	[id_client] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Client primary key, --номер клиента
	[Surname] varchar(50) NOT NULL, --фамилия клиента
	[Name] varchar(50) NOT NULL, --имя клиента
	[Patronymic] varchar(50) NOT NULL, --отчество клиента
	[Phone] varchar(50) NOT NULL, --телефон клиента
);

CREATE TABLE [Client's_Size] ( --размеры клиента
	[id_measurement] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Client's_Size] primary key, --номер замерки
	[Chest_girth] float, --обхват груди
	[Head_girth] float, --обхват головы
	[Waist_girth] float, --обхват талии
	[Hip_girth] float, --обхват бёдер
	[Shoe_size] float, --размер обуви
	[Date_taking_measurement] date NOT NULL, --дата снятия мерок
);

CREATE TABLE [Clothing_model] ( --модель одежды
	[id_model] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Clothing_model] primary key, --номер модели
	[Name of model] varchar(50) NOT NULL, --название модели
	[Cost] money NOT NULL, --стоимость модели
	[Required_quantity_material] int NOT NULL, --требуемое количество материала
);

CREATE TABLE [Order_material] ( --заказ материала
	[id_order_material] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Order_material] primary key, --номер заказа материала
	[id_model] int NOT NULL, --номер модели
	[id_material] int NOT NULL, --номер материала
	[Quantity_goods] int NOT NULL, --количество материала
	[Cost] money NOT NULL, --стоимость
);

CREATE TABLE [Material] ( --материал
	[id_material] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Material primary key, --номер материала
	[id_provider] int NOT NULL, --номер поставщика
	[Cost_per_unit] money NOT NULL, --цена за единицу
	[Name_material] varchar(50) NOT NULL, --название материала
);

CREATE TABLE [Provider] ( --поставщик
	[id_provider] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Provider primary key, --номер поставщика
	[Company_name] varchar(50) NOT NULL, --название компании
	[Phone] varchar(50) NOT NULL, --номер телефона
);

CREATE TABLE [Employee] ( --работник
	[id_employee] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Employee primary key, --номер работника
	[Surname] varchar(50) NOT NULL, --фамилия
	[Name] varchar(50) NOT NULL, --имя
	[Patronymic] varchar(50) NOT NULL, --отчество
	[Phone] varchar(50) NOT NULL, --телефон
	[Wage-rate] money NOT NULL, --ставка
	[SNILS] varchar(11) NOT NULL UNIQUE, --СНИЛС
	[INN] varchar(12) NOT NULL UNIQUE, --ИНН
);

CREATE TABLE [Comment] ( --отзыв
	[id_comment] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Comment primary key, --номер отзыва
	[id_client] int NOT NULL, --номер клиента
	[id_employee] int NOT NULL, --номер работника
	[Quality_work] int NOT NULL, --качество работы
);

CREATE TABLE [Type_of_work] ( --вид работы
	[id_work] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Type_of_work] primary key, --номер работы
	[id_employee] int NOT NULL, --номер работника
	[id_model] int NOT NULL, --номер модели
	[Term_of_work] date NOT NULL, --срок работы
);

CREATE TABLE [Discount] ( --скидка
	[id_discount] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Discount primary key, --номер скидки
	[Amount_discount] float NOT NULL, --размер скидки
	[Start_discount] datetime, --дата начала действия скидки
	[End_discount] datetime, --дата окончания действия скидки
);

CREATE TABLE [Employee's_specialization] ( --специализация работника
	[id] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Employee's_specialization] primary key, --номер соотношения специализации и работника
	[id_employee] int NOT NULL, --номер работника
	[id_specialization] int NOT NULL, --номер специализации
);

CREATE TABLE [Specialization] ( --специализация
	[id_specialization] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Specialization primary key, --номер специализации
	[Name_specialization] varchar(50) NOT NULL, --название специализации
);


ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Order_Client_] --1
FOREIGN KEY ([id_client]) references [Client]([id_client])
on delete no action

ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Client's_Size] --2
FOREIGN KEY ([id_measurement]) references [Client's_Size]([id_measurement])
on delete no action

ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Type_of_work] --3
FOREIGN KEY ([id_work]) references [Type_of_work]([id_work])
on delete no action

ALTER TABLE [Client's_Order] ADD CONSTRAINT [FK_Client's_Discount] --4
FOREIGN KEY ([id_discount]) references [Discount]([id_discount])
on delete no action

/*1)ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk0] FOREIGN KEY ([№ клиента]) REFERENCES [Клиент]([№ клиента])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk0]
GO
2)ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk1] FOREIGN KEY ([№ замерки])
REFERENCES [Размеры клиента]([№ замерки])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk1]
GO
3)ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk2] FOREIGN KEY ([№ работы]) REFERENCES [Вид работы]([№ работы])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk2]
GO
4)ALTER TABLE [Заказ клиента] WITH CHECK ADD CONSTRAINT [Заказ клиента_fk3] FOREIGN KEY ([№ скидки]) REFERENCES [Скидки]([№ скидки])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ клиента] CHECK CONSTRAINT [Заказ клиента_fk3]
GO*/

ALTER TABLE [Order_material] ADD CONSTRAINT [FK_Order_material_Clothing_model] --1
FOREIGN KEY ([id_model]) references [Clothing_model]([id_model])
on delete no action

ALTER TABLE [Order_material] ADD CONSTRAINT [FK_Order_material_Material] --2
FOREIGN KEY ([id_material]) references [Material]([id_material])
on delete no action


/*1)ALTER TABLE [Заказ материала] WITH CHECK ADD CONSTRAINT [Заказ материала_fk0] FOREIGN KEY ([№ модели]) REFERENCES [Модель одежды]([№ модели])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ материала] CHECK CONSTRAINT [Заказ материала_fk0]
GO
2)ALTER TABLE [Заказ материала] WITH CHECK ADD CONSTRAINT [Заказ материала_fk1] FOREIGN KEY ([№ материала]) REFERENCES [Материал]([№ материала])
ON UPDATE CASCADE
GO
ALTER TABLE [Заказ материала] CHECK CONSTRAINT [Заказ материала_fk1]
GO*/

ALTER TABLE [Material] ADD CONSTRAINT [FK_Material_Provider] --1
FOREIGN KEY ([id_provider]) references [Provider]([id_provider])
on delete no action

/*1)ALTER TABLE [Материал] WITH CHECK ADD CONSTRAINT [Материал_fk0] FOREIGN KEY ([№ поставщика]) REFERENCES [Поставщик]([№ поставщика])
ON UPDATE CASCADE
GO
ALTER TABLE [Материал] CHECK CONSTRAINT [Материал_fk0]
GO*/

ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comment_Client] --1
FOREIGN KEY ([id_client]) references [Client]([id_client])
on delete no action

ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comment_Employee] --2
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

/*1)ALTER TABLE [Отзыв] WITH CHECK ADD CONSTRAINT [Отзыв_fk0] FOREIGN KEY ([№ клиента]) REFERENCES [Клиент]([№ клиента])
ON UPDATE CASCADE
GO
ALTER TABLE [Отзыв] CHECK CONSTRAINT [Отзыв_fk0]
GO
2)ALTER TABLE [Отзыв] WITH CHECK ADD CONSTRAINT [Отзыв_fk1] FOREIGN KEY ([№ работника]) REFERENCES [Работник]([№ работника])
ON UPDATE CASCADE
GO
ALTER TABLE [Отзыв] CHECK CONSTRAINT [Отзыв_fk1]
GO*/

ALTER TABLE [Type_of_work] ADD CONSTRAINT [FK_Type_of_work_Employee] --1
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Type_of_work] ADD CONSTRAINT [FK_Type_of_work_Clothing_model] --2
FOREIGN KEY ([id_model]) references [Clothing_model]([id_model])
on delete no action

/*1)ALTER TABLE [Вид работы] WITH CHECK ADD CONSTRAINT [Вид работы_fk0] FOREIGN KEY ([№ работника]) REFERENCES [Работник]([№ работника])
ON UPDATE CASCADE
GO
ALTER TABLE [Вид работы] CHECK CONSTRAINT [Вид работы_fk0]
GO
2)ALTER TABLE [Вид работы] WITH CHECK ADD CONSTRAINT [Вид работы_fk1] FOREIGN KEY ([№ модели]) REFERENCES [Модель одежды]([№ модели])
ON UPDATE CASCADE
GO
ALTER TABLE [Вид работы] CHECK CONSTRAINT [Вид работы_fk1]
GO*/

ALTER TABLE [Employee's_specialization] ADD CONSTRAINT [FK_Employee's_specialization_Employee] --1
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Employee's_specialization] ADD CONSTRAINT [FK_Employee's_specialization_Specialization] --2
FOREIGN KEY ([id_specialization]) references [Specialization]([id_specialization])
on delete no action

/*1)ALTER TABLE [Специализация работника] WITH CHECK ADD CONSTRAINT [Специализация работника_fk0] 
FOREIGN KEY ([№ работника]) REFERENCES [Работник]([№ работника])
ON UPDATE CASCADE
GO
ALTER TABLE [Специализация работника] CHECK CONSTRAINT [Специализация работника_fk0]
GO
2)ALTER TABLE [Специализация работника] WITH CHECK ADD CONSTRAINT [Специализация работника_fk1] 
FOREIGN KEY ([№ специализации]) REFERENCES [Специализация]([№ специализации])
ON UPDATE CASCADE
GO
ALTER TABLE [Специализация работника] CHECK CONSTRAINT [Специализация работника_fk1]
GO*/