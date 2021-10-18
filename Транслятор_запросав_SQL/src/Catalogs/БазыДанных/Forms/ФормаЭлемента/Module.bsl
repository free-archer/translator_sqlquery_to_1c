&НаКлиенте
Процедура УдалитьСтруктуру(Команда)
	УдалитьСтруктуруНаСервере();
КонецПроцедуры

&НаСервере
Процедура УдалитьСтруктуруНаСервере()
	СтруктураДанныхСервер.УдалитьСтруктуруНаСервере(Ложь);
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьСтруктуруБД(Команда)
	Если ЭтаФорма.Модифицированность Тогда
		Сообщить("Сначала запишите данные");
	Иначе
		ЗаполнитьСтруктуруБДНаСервере();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьСтруктуруБДНаСервере()

	СтруктураДанныхСервер.УдалитьСтруктуруНаСервере(Ложь);

	СтруктураДанныхСервер.ЗаполнитьДеревоМД(Объект.Ссылка);

	СтруктураХраненияБазыДанных = ПолучитьСтруктуруХраненияБазыДанных();
	Для Каждого СтрокаХраненияБД Из СтруктураХраненияБазыДанных Цикл
		НайденныеМетоданные1С= Справочники.Методанные1С.НайтиПоРеквизиту("Метаданные", СтрокаХраненияБД.Метаданные, ,
			Объект.Ссылка);
		Если Не ЗначениеЗаполнено(НайденныеМетоданные1С) Тогда
			Продолжить;
		КонецЕсли;

		Методанные1С= НайденныеМетоданные1С.ПолучитьОбъект();
		Методанные1С.ИмяТаблицыХранения= СтрокаХраненияБД.ИмяТаблицыХранения;
		Методанные1С.Назначение= СтрокаХраненияБД.Назначение;
		Методанные1С.Записать();

		Для Каждого СтрокаПоляБД Из СтрокаХраненияБД.Поля Цикл
			НайденноеПоле= Справочники.Поля.НайтиПоНаименованию(СтрокаПоляБД.ИмяПоля, Истина, , Методанные1С.Ссылка);
			Если Не ЗначениеЗаполнено(НайденноеПоле) Тогда
				Продолжить;
			КонецЕсли;
			Поле= НайденноеПоле.ПолучитьОбъект();
			Поле.ИмяХранения= СтрокаПоляБД.ИмяПоляХранения;
			Поле.Записать();
			Для Каждого СтрокаПоляБД Из СтрокаХраненияБД.Индексы Цикл
				ИмяИндексаХранения= СтрокаПоляБД.ИмяИндексаХранения;
				Для Каждого ПолеИндекса Из СтрокаПоляБД.Поля Цикл
					ИмяПоляИндексаХранения= ПолеИндекса[0];
					ИмяПоляИндекса= ПолеИндекса[1];
					НайденноеПоле= Справочники.ПоляИндексов.НайтиПоНаименованию(ИмяПоляИндекса, Истина, , Поле.Ссылка);
					Если Не ЗначениеЗаполнено(НайденноеПоле) Тогда
						Продолжить;
					КонецЕсли;
					ПолеИндекса= НайденноеПоле.ПолучитьОбъект();
					ПолеИндекса.ИмяХранения= ИмяИндексаХранения;
					ПолеИндекса.Записать();
				КонецЦикла;
			КонецЦикла;
		КонецЦикла;
	КонецЦикла;

КонецПроцедуры