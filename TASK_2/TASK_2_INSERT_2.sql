---размеры клиента
INSERT [Client's_Size]
(Head_girth, Date_taking_measurement)
 values
('56', '2017-08-12')

INSERT [Client's_Size]
(Shoe_size, Date_taking_measurement)
values
('42', '2017-10-05')

INSERT [Client's_Size]
(Chest_girth, Waist_girth, Hip_girth, Date_taking_measurement)
values
('90', '60', '90', '2017-11-30')

--клиент
INSERT [Client]
(Surname, Name, Patronymic, Phone)
 values
('Семиврагов', 'Александр', 'Алексеевич', '89172054876'),
('Феофанов', 'Никита', 'Андреевич', '89265487896')

INSERT [Specialization]
(Name_specialization)
values
('Дизайнер'),
('Технолог'),
('Конструктор'),
('Швея'),
('Закройщик')

INSERT [Employee]
(Surname, Name, Patronymic, Phone, [Wage-rate], SNILS, INN)
values
('Иванов', 'Иван', 'Иванович', '89472226655', '15000', '45698213654', '159753684265'),
('Петров', 'Пётр', 'Петрович', '89465263214', '20000', '56974516597', '154786523215'),
('Смирнов', 'Алексей', 'Степанович', '89264586547', '17000', '1111111111', '222222222222'),
('Новогоднев', 'Семён', 'Андреевич', '89175455644', '19000', '52698745152', '465231987454'),
('Чередников', 'Илья', 'Эдуардович', '89602545566', '18000', '41253698745', '562148932545'),
('Андреев', 'Павел', 'Артёмович', '87855556985', '14000', '58964235874', '453215896541')

INSERT [Provider]
(Company_name, Phone)
values
('Наша компания', '456585'),
('Материалист', '698547'),
('Хозяин-барин', '152987')

INSERT [Material]
(id_provider, Cost_per_unit, Name_material)
values
('1', '2000', 'Шёлк'),
('3', '1000', 'Бязь')

INSERT [Client]
(Surname, Name, Patronymic, Phone)
 values
('Кривоножкин', 'Александр', 'Михайлович', '89372204031')

INSERT [Employee's_specialization]
(id_employee, id_specialization)
values
('1', '1'),
('2', '3'),
('3', '5'),
('4', '4'),
('5', '2'),
('6', '1'),
('6', '2'),
('6', '3')

INSERT [Comment]
(id_client, id_employee, Quality_work)
values
('1', '4', '10')

INSERT [Clothing_model]
([Name of model], Cost, Required_quantity_material)
values
('Шляпа', '1000', '20'),
('Платье', '15000', '50'),
('Туфли', '9000', '45')

/*INSERT [Discount]
(Amount_discount, Start_discount, End_discount)
values
('15', '2018-01-01', '2018-02-22')*/

INSERT [Discount]
(Amount_discount)
values
('80')

INSERT [Type_of_work]
(id_employee, id_model, Term_of_work)
values
('6', '2', '2018-03-09')

INSERT [Client's_Order]
(id_client, id_measurement, id_work, Cost, Order_date, Measurement_date, Order_execution_date, id_discount)
values
('3', '1', '1', '1000', '2017-07-10', '2017-09-20', '2018-03-09', '1')

INSERT [Order_material]
(id_model, id_material, Quantity_goods, Cost)
values
('2', '1', '10', '20000'),
('3', '2', '30', '30000')
