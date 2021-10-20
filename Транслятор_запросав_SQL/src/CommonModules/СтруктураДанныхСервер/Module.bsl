
#Область СтруктураДанных

Процедура ЗаполнитьСтруктуруБДНаСервере(СтруктураХраненияБазыДанных, БазаДанных) Экспорт
	
	//ЗаполнитьДеревоМД(БазаДанных);
	
	Для Каждого СтрокаХраненияБД Из СтруктураХраненияБазыДанных Цикл 
		мИмен= СтрРазделить(СтрокаХраненияБД.Метаданные, ".");
		Если мИмен.Количество() < 2 Тогда
			Продолжить;
		КонецЕсли;  
		
		ИмяРаздела= мИмен[0];
		ИмяОбъекта= мИмен[1];
		
		//Разделы
		Раздел= Справочники.Методанные1С.НайтиПоНаименованию(ИмяРаздела, Истина,, БазаДанных);
		Если Не ЗначениеЗаполнено(Раздел) Тогда
			НовыйРаздел= Справочники.Методанные1С.СоздатьГруппу();
			НовыйРаздел.Наименование= ИмяРаздела;
			НовыйРаздел.Владелец= БазаДанных;
			НовыйРаздел.Записать();
			Раздел= НовыйРаздел.Ссылка;
		КонецЕсли;
		
		Методанные1С= Справочники.Методанные1С.СоздатьЭлемент();
		Методанные1С.Владелец= БазаДанных;
		Методанные1С.Родитель= Раздел;
		Методанные1С.ИмяТаблицыХранения= СтрокаХраненияБД.ИмяТаблицыХранения;
		Методанные1С.Наименование= ИмяОбъекта;
		Методанные1С.Назначение= СтрокаХраненияБД.Назначение;
		Методанные1С.Метаданные= СтрокаХраненияБД.Метаданные;
		мИмен= СтрРазделить(СтрокаХраненияБД.Метаданные, ".");
		Если мИмен.Количество() > 0 Тогда
			Методанные1С.Имя= мИмен[мИмен.Количество()-1];
		КонецЕсли;
		Методанные1С.Записать();
		
		Для Каждого СтрокаПоляБД Из СтрокаХраненияБД.Поля Цикл
			Поле= Справочники.Поля.СоздатьЭлемент();
			Поле.Владелец= Методанные1С.Ссылка; 
			Поле.Наименование= ?(ПустаяСтрока(СтрокаПоляБД.ИмяПоля), СтрокаПоляБД.ИмяПоляХранения, СтрокаПоляБД.ИмяПоля);
			Поле.ИмяХранения= СтрокаПоляБД.ИмяПоляХранения;
			Поле.ИмяТаблицыХранения= Методанные1С.ИмяТаблицыХранения;
			Поле.Записать(); 
			
			Для Каждого СтрокаПоляИндексаБД Из СтрокаХраненияБД.Индексы Цикл
				Индекс= Справочники.Индексы.СоздатьЭлемент();
				Индекс.Владелец= Поле.Ссылка; 
				Индекс.Наименование= СтрокаПоляИндексаБД.ИмяИндексаХранения;
				Индекс.Записать();				
				
				Для Каждого ПолеИндексаБД Из СтрокаПоляИндексаБД.Поля Цикл
					ПолеИндекса= Справочники.ПоляИндексов.СоздатьЭлемент();
					ПолеИндекса.Владелец= Индекс.Ссылка;
					//НайденоеПоле= Справочники.Поля.НайтиПоРеквизиту("ИмяХранения", ПолеИндексаБД.ИмяПоляХранения,, Методанные1С.Ссылка); 
					//ПолеИндекса.Наименование= ?(ЗначениеЗаполнено(НайденоеПоле), НайденоеПоле.Наименование, ПолеИндексаБД.ИмяПоляХранения);
					ПолеИндекса.Наименование= ?(Не ПустаяСтрока(ПолеИндексаБД.ИмяПоля), ПолеИндексаБД.ИмяПоля, ПолеИндексаБД.ИмяПоляХранения);
					ПолеИндекса.ИмяХранения= ПолеИндексаБД.ИмяПоляХранения;
					ПолеИндекса.Записать();
					
				КонецЦикла;
			КонецЦикла;
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

Процедура ЗаполнитьДеревоМД(БазаДанных) Экспорт
	
	ДобавитьКлассМД(БазаДанных, "Планы обмена", Метаданные.ПланыОбмена, БиблиотекаКартинок.ПланОбмена);
	ДобавитьКлассМД(БазаДанных, "Константы", Метаданные.Константы, БиблиотекаКартинок.Константа);
	ДобавитьКлассМД(БазаДанных, "Справочники", Метаданные.Справочники, БиблиотекаКартинок.Справочник);
	ДобавитьКлассМД(БазаДанных, "Документы", Метаданные.Документы, БиблиотекаКартинок.Документ);
	ДобавитьКлассМД(БазаДанных, "Журналы документов", Метаданные.ЖурналыДокументов, БиблиотекаКартинок.ЖурналДокументов);
	ДобавитьКлассМД(БазаДанных, "Перечисления", Метаданные.Перечисления, БиблиотекаКартинок.Перечисление);
	ДобавитьКлассМД(БазаДанных, "Планы видов характеристик", Метаданные.ПланыВидовХарактеристик, БиблиотекаКартинок.ПланВидовХарактеристик);
	ДобавитьКлассМД(БазаДанных, "Планы счетов", Метаданные.ПланыСчетов, БиблиотекаКартинок.ПланСчетов);
	ДобавитьКлассМД(БазаДанных, "Планы видов расчета", Метаданные.ПланыВидовРасчета, БиблиотекаКартинок.ПланВидовРасчета);
	ДобавитьКлассМД(БазаДанных, "Регистры сведений", Метаданные.РегистрыСведений, БиблиотекаКартинок.РегистрСведений);
	ДобавитьКлассМД(БазаДанных, "Регистры накопления", Метаданные.РегистрыНакопления, БиблиотекаКартинок.РегистрНакопления);
	ДобавитьКлассМД(БазаДанных, "Регистры бухгалтерии", Метаданные.РегистрыБухгалтерии, БиблиотекаКартинок.РегистрБухгалтерии);
	ДобавитьКлассМД(БазаДанных, "Регистры расчета", Метаданные.РегистрыРасчета, БиблиотекаКартинок.РегистрРасчета);
	ДобавитьКлассМД(БазаДанных, "Бизнес-процессы", Метаданные.БизнесПроцессы, БиблиотекаКартинок.БизнесПроцесс);
	ДобавитьКлассМД(БазаДанных, "Задачи", Метаданные.Задачи, БиблиотекаКартинок.Задача);
	ДобавитьКлассМД(БазаДанных, "Внешние источники данных", Метаданные.ВнешниеИсточникиДанных, БиблиотекаКартинок.ВнешнийИсточникДанных);
	
КонецПроцедуры

Процедура ДобавитьКлассМД(БазаДанных, ИмяРаздела, КлассМД, ИконкаПодчиненного)
	
	Если КлассМД.Количество() > 0 Тогда
		НовыйРаздел= Справочники.Методанные1С.СоздатьГруппу();
		НовыйРаздел.Наименование= ИмяРаздела;
		НовыйРаздел.Владелец= БазаДанных;
		НовыйРаздел.Записать();
	КонецЕсли;
	
	Для Каждого ОбъектМД Из КлассМД Цикл
		
		НовыйЭлемент= Справочники.Методанные1С.СоздатьЭлемент();
		НовыйЭлемент.Владелец= БазаДанных;
		НовыйЭлемент.Родитель= НовыйРаздел.Ссылка;
		НовыйЭлемент.Наименование= ОбъектМД.Имя;
		НовыйЭлемент.Метаданные= ОбъектМД.ПолноеИмя();
		НовыйЭлемент.Синоним= ?(ОбъектМД.Синоним = "", ОбъектМД.Имя, ОбъектМД.Синоним);
		НовыйЭлемент.Записать();
		
		
		Для Каждого Реквизит Из ОбъектМД.СтандартныеРеквизиты Цикл
			НовоеПоле= Справочники.Поля.СоздатьЭлемент();
			НовоеПоле.Владелец= НовыйЭлемент.Ссылка;
			НовоеПоле.Наименование= Реквизит.Имя;
			НовоеПоле.Синоним= ?(Реквизит.Синоним = "", Реквизит.Имя, Реквизит.Синоним);
			НовоеПоле.Записать();
		КонецЦикла;
		
		Для Каждого Реквизит Из ОбъектМД.Реквизиты Цикл
			НовоеПоле= Справочники.Поля.СоздатьЭлемент();
			НовоеПоле.Владелец= НовыйЭлемент.Ссылка;
			НовоеПоле.Наименование= Реквизит.Имя;
			НовоеПоле.Синоним= ?(Реквизит.Синоним = "", Реквизит.Имя, Реквизит.Синоним);
			НовоеПоле.Записать();
		КонецЦикла;
		
	КонецЦикла;
	
КонецПроцедуры

Процедура УдалитьСтруктуруНаСервере(Всю=Ложь, БазаДанных=Неопределено) Экспорт
	Если Всю Тогда
		Выборка= Справочники.БазыДанных.Выбрать();
		Пока Выборка.Следующий() Цикл
			Элем= Выборка.Ссылка.ПолучитьОбъект();
			Элем.Удалить();
		КонецЦикла;
	КонецЕсли; 
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	Методанные1С.Ссылка КАК Ссылка,
	|	Методанные1С.ЭтоГруппа КАК ЭтоГруппа
	|ИЗ
	|	Справочник.Методанные1С КАК Методанные1С
	|ГДЕ
	|	Методанные1С.Владелец = &Владелец
	|
	|УПОРЯДОЧИТЬ ПО
	|	ЭтоГруппа";
	Запрос.УстановитьПараметр("Владелец", БазаДанных);
	РезультатЗапроса = Запрос.Выполнить();
	ВыборкаМетоданные1С = РезультатЗапроса.Выбрать();
	Пока ВыборкаМетоданные1С.Следующий() Цикл   
		
		ВыборкаПолей= Справочники.Поля.Выбрать(, ВыборкаМетоданные1С.Ссылка);
		Пока ВыборкаПолей.Следующий() Цикл  
			
			ВыборкаИндексов= Справочники.Индексы.Выбрать(, ВыборкаПолей.Ссылка);
			Пока ВыборкаИндексов.Следующий() Цикл
				
				ВыборкаПолейИндексов= Справочники.ПоляИндексов.Выбрать(, ВыборкаИндексов.Ссылка);
				Пока ВыборкаПолейИндексов.Следующий() Цикл
					Элем= ВыборкаПолейИндексов.Ссылка.ПолучитьОбъект();
					Элем.Удалить();
				КонецЦикла;
				
				Индекс= ВыборкаИндексов.Ссылка.ПолучитьОбъект();
				Индекс.Удалить();
			КонецЦикла; 
			
			Поле= ВыборкаПолей.Ссылка.ПолучитьОбъект();
			Поле.Удалить();
		КонецЦикла;
		
		Методанные1С= ВыборкаМетоданные1С.Ссылка.ПолучитьОбъект();
		Методанные1С.Удалить();
	КонецЦикла;
КонецПроцедуры
#КонецОбласти

