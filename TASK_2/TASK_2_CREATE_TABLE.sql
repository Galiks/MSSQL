CREATE TABLE [Client's_Order] ( --����� �������
	[id_order] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Client's_Order] primary key, --����� ������
	[id_client] int NOT NULL, --����� �������
	[id_measurement] int NOT NULL, --����� �������
	[id_work] int NOT NULL, --����� ������
	[Cost] money NOT NULL, --���������
	[Order_date] date NOT NULL, --���� ������
	[Measurement_date] date NOT NULL, --���� �������
	[Order_execution_date] date NOT NULL, --���� ���������� ������
	[id_discount] int, --����� ������
);

CREATE TABLE [Client] ( --������
	[id_client] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Client primary key, --����� �������
	[Surname] varchar(50) NOT NULL, --������� �������
	[Name] varchar(50) NOT NULL, --��� �������
	[Patronymic] varchar(50) NOT NULL, --�������� �������
	[Phone] varchar(50) NOT NULL, --������� �������
);

CREATE TABLE [Client's_Size] ( --������� �������
	[id_measurement] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Client's_Size] primary key, --����� �������
	[Chest_girth] float, --������ �����
	[Head_girth] float, --������ ������
	[Waist_girth] float, --������ �����
	[Hip_girth] float, --������ ����
	[Shoe_size] float, --������ �����
	[Date_taking_measurement] date NOT NULL, --���� ������ �����
);

CREATE TABLE [Clothing_model] ( --������ ������
	[id_model] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Clothing_model] primary key, --����� ������
	[Name of model] varchar(50) NOT NULL, --�������� ������
	[Cost] money NOT NULL, --��������� ������
	[Required_quantity_material] int NOT NULL, --��������� ���������� ���������
);

CREATE TABLE [Order_material] ( --����� ���������
	[id_order_material] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Order_material] primary key, --����� ������ ���������
	[id_model] int NOT NULL, --����� ������
	[id_material] int NOT NULL, --����� ���������
	[Quantity_goods] int NOT NULL, --���������� ���������
	[Cost] money NOT NULL, --���������
);

CREATE TABLE [Material] ( --��������
	[id_material] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Material primary key, --����� ���������
	[id_provider] int NOT NULL, --����� ����������
	[Cost_per_unit] money NOT NULL, --���� �� �������
	[Name_material] varchar(50) NOT NULL, --�������� ���������
);

CREATE TABLE [Provider] ( --���������
	[id_provider] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Provider primary key, --����� ����������
	[Company_name] varchar(50) NOT NULL, --�������� ��������
	[Phone] varchar(50) NOT NULL, --����� ��������
);

CREATE TABLE [Employee] ( --��������
	[id_employee] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Employee primary key, --����� ���������
	[Surname] varchar(50) NOT NULL, --�������
	[Name] varchar(50) NOT NULL, --���
	[Patronymic] varchar(50) NOT NULL, --��������
	[Phone] varchar(50) NOT NULL, --�������
	[Wage-rate] money NOT NULL, --������
	[SNILS] varchar(11) NOT NULL UNIQUE, --�����
	[INN] varchar(12) NOT NULL UNIQUE, --���
);

CREATE TABLE [Comment] ( --�����
	[id_comment] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Comment primary key, --����� ������
	[id_client] int NOT NULL, --����� �������
	[id_employee] int NOT NULL, --����� ���������
	[Quality_work] int NOT NULL, --�������� ������
);

CREATE TABLE [Type_of_work] ( --��� ������
	[id_work] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Type_of_work] primary key, --����� ������
	[id_employee] int NOT NULL, --����� ���������
	[id_model] int NOT NULL, --����� ������
	[Term_of_work] date NOT NULL, --���� ������
);

CREATE TABLE [Discount] ( --������
	[id_discount] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Discount primary key, --����� ������
	[Amount_discount] float NOT NULL, --������ ������
	[Start_discount] datetime, --���� ������ �������� ������
	[End_discount] datetime, --���� ��������� �������� ������
);

CREATE TABLE [Employee's_specialization] ( --������������� ���������
	[id] int IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Employee's_specialization] primary key, --����� ����������� ������������� � ���������
	[id_employee] int NOT NULL, --����� ���������
	[id_specialization] int NOT NULL, --����� �������������
);

CREATE TABLE [Specialization] ( --�������������
	[id_specialization] int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Specialization primary key, --����� �������������
	[Name_specialization] varchar(50) NOT NULL, --�������� �������������
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

/*1)ALTER TABLE [����� �������] WITH CHECK ADD CONSTRAINT [����� �������_fk0] FOREIGN KEY ([� �������]) REFERENCES [������]([� �������])
ON UPDATE CASCADE
GO
ALTER TABLE [����� �������] CHECK CONSTRAINT [����� �������_fk0]
GO
2)ALTER TABLE [����� �������] WITH CHECK ADD CONSTRAINT [����� �������_fk1] FOREIGN KEY ([� �������])
REFERENCES [������� �������]([� �������])
ON UPDATE CASCADE
GO
ALTER TABLE [����� �������] CHECK CONSTRAINT [����� �������_fk1]
GO
3)ALTER TABLE [����� �������] WITH CHECK ADD CONSTRAINT [����� �������_fk2] FOREIGN KEY ([� ������]) REFERENCES [��� ������]([� ������])
ON UPDATE CASCADE
GO
ALTER TABLE [����� �������] CHECK CONSTRAINT [����� �������_fk2]
GO
4)ALTER TABLE [����� �������] WITH CHECK ADD CONSTRAINT [����� �������_fk3] FOREIGN KEY ([� ������]) REFERENCES [������]([� ������])
ON UPDATE CASCADE
GO
ALTER TABLE [����� �������] CHECK CONSTRAINT [����� �������_fk3]
GO*/

ALTER TABLE [Order_material] ADD CONSTRAINT [FK_Order_material_Clothing_model] --1
FOREIGN KEY ([id_model]) references [Clothing_model]([id_model])
on delete no action

ALTER TABLE [Order_material] ADD CONSTRAINT [FK_Order_material_Material] --2
FOREIGN KEY ([id_material]) references [Material]([id_material])
on delete no action


/*1)ALTER TABLE [����� ���������] WITH CHECK ADD CONSTRAINT [����� ���������_fk0] FOREIGN KEY ([� ������]) REFERENCES [������ ������]([� ������])
ON UPDATE CASCADE
GO
ALTER TABLE [����� ���������] CHECK CONSTRAINT [����� ���������_fk0]
GO
2)ALTER TABLE [����� ���������] WITH CHECK ADD CONSTRAINT [����� ���������_fk1] FOREIGN KEY ([� ���������]) REFERENCES [��������]([� ���������])
ON UPDATE CASCADE
GO
ALTER TABLE [����� ���������] CHECK CONSTRAINT [����� ���������_fk1]
GO*/

ALTER TABLE [Material] ADD CONSTRAINT [FK_Material_Provider] --1
FOREIGN KEY ([id_provider]) references [Provider]([id_provider])
on delete no action

/*1)ALTER TABLE [��������] WITH CHECK ADD CONSTRAINT [��������_fk0] FOREIGN KEY ([� ����������]) REFERENCES [���������]([� ����������])
ON UPDATE CASCADE
GO
ALTER TABLE [��������] CHECK CONSTRAINT [��������_fk0]
GO*/

ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comment_Client] --1
FOREIGN KEY ([id_client]) references [Client]([id_client])
on delete no action

ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comment_Employee] --2
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

/*1)ALTER TABLE [�����] WITH CHECK ADD CONSTRAINT [�����_fk0] FOREIGN KEY ([� �������]) REFERENCES [������]([� �������])
ON UPDATE CASCADE
GO
ALTER TABLE [�����] CHECK CONSTRAINT [�����_fk0]
GO
2)ALTER TABLE [�����] WITH CHECK ADD CONSTRAINT [�����_fk1] FOREIGN KEY ([� ���������]) REFERENCES [��������]([� ���������])
ON UPDATE CASCADE
GO
ALTER TABLE [�����] CHECK CONSTRAINT [�����_fk1]
GO*/

ALTER TABLE [Type_of_work] ADD CONSTRAINT [FK_Type_of_work_Employee] --1
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Type_of_work] ADD CONSTRAINT [FK_Type_of_work_Clothing_model] --2
FOREIGN KEY ([id_model]) references [Clothing_model]([id_model])
on delete no action

/*1)ALTER TABLE [��� ������] WITH CHECK ADD CONSTRAINT [��� ������_fk0] FOREIGN KEY ([� ���������]) REFERENCES [��������]([� ���������])
ON UPDATE CASCADE
GO
ALTER TABLE [��� ������] CHECK CONSTRAINT [��� ������_fk0]
GO
2)ALTER TABLE [��� ������] WITH CHECK ADD CONSTRAINT [��� ������_fk1] FOREIGN KEY ([� ������]) REFERENCES [������ ������]([� ������])
ON UPDATE CASCADE
GO
ALTER TABLE [��� ������] CHECK CONSTRAINT [��� ������_fk1]
GO*/

ALTER TABLE [Employee's_specialization] ADD CONSTRAINT [FK_Employee's_specialization_Employee] --1
FOREIGN KEY ([id_employee]) references [Employee]([id_employee])
on delete no action

ALTER TABLE [Employee's_specialization] ADD CONSTRAINT [FK_Employee's_specialization_Specialization] --2
FOREIGN KEY ([id_specialization]) references [Specialization]([id_specialization])
on delete no action

/*1)ALTER TABLE [������������� ���������] WITH CHECK ADD CONSTRAINT [������������� ���������_fk0] 
FOREIGN KEY ([� ���������]) REFERENCES [��������]([� ���������])
ON UPDATE CASCADE
GO
ALTER TABLE [������������� ���������] CHECK CONSTRAINT [������������� ���������_fk0]
GO
2)ALTER TABLE [������������� ���������] WITH CHECK ADD CONSTRAINT [������������� ���������_fk1] 
FOREIGN KEY ([� �������������]) REFERENCES [�������������]([� �������������])
ON UPDATE CASCADE
GO
ALTER TABLE [������������� ���������] CHECK CONSTRAINT [������������� ���������_fk1]
GO*/