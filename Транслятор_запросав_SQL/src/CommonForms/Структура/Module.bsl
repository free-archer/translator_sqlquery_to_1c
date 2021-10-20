&НаКлиенте
Процедура ПриОткрытии(Отказ)
	БазаДанныхПриИзменении(Неопределено);
КонецПроцедуры

&НаКлиенте
Процедура БазаДанныхПриИзменении(Элемент)
	Отбор = Методанные1С.КомпоновщикНастроек.Настройки.Отбор.Элементы;
	Отбор.Очистить();

	УсловиеОтбора = Отбор.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	УсловиеОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Владелец");
	УсловиеОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	УсловиеОтбора.ПравоеЗначение = БазаДанных;

	Методанные1С.КомпоновщикНастроек.ЗагрузитьНастройки(Методанные1С.КомпоновщикНастроек.Настройки);
КонецПроцедуры



&НаКлиенте
Процедура Методанные1СПриАктивизацииСтроки(Элемент)
	Отбор = Поля.КомпоновщикНастроек.Настройки.Отбор.Элементы;
	Отбор.Очистить();

	УсловиеОтбора = Отбор.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	УсловиеОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Владелец");
	УсловиеОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	УсловиеОтбора.ПравоеЗначение = Элементы.Методанные1С.ТекущаяСтрока;

	Поля.КомпоновщикНастроек.ЗагрузитьНастройки(Поля.КомпоновщикНастроек.Настройки);


КонецПроцедуры

&НаКлиенте
Процедура ПоляПриАктивизацииСтроки(Элемент)
	Отбор = Индексы.КомпоновщикНастроек.Настройки.Отбор.Элементы;
	Отбор.Очистить();

	УсловиеОтбора = Отбор.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	УсловиеОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Владелец");
	УсловиеОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	УсловиеОтбора.ПравоеЗначение = Элементы.Поля.ТекущаяСтрока;

	Индексы.КомпоновщикНастроек.ЗагрузитьНастройки(Индексы.КомпоновщикНастроек.Настройки);
КонецПроцедуры


&НаКлиенте
Процедура ИндексыПриАктивизацииСтроки(Элемент)
	Отбор = ПоляИндексов.КомпоновщикНастроек.Настройки.Отбор.Элементы;
	Отбор.Очистить();

	УсловиеОтбора = Отбор.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	УсловиеОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Владелец");
	УсловиеОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	УсловиеОтбора.ПравоеЗначение = Элементы.Индексы.ТекущаяСтрока;

	ПоляИндексов.КомпоновщикНастроек.ЗагрузитьНастройки(ПоляИндексов.КомпоновщикНастроек.Настройки);
КонецПроцедуры

