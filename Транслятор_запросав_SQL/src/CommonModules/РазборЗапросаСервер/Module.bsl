                                                   
Функция РазобратьПланЗапроса(ТекстSQL, БазаДанных) Экспорт
	//ТекстSQL= "|--Clustered Index Seek(OBJECT:([bespalov_trade].[dbo].[_AccumRgT9212].[_AccumRgT9212_1] AS [T11]),";
	Текст1С= ТекстSQL;
	
	//Заменить таблицу SQL
	Шаблон= "\[dbo\].\[[\w]+\]";
	НайденаяТаблицаSQL= РегулярныеВыражения.RegExp(Шаблон, ТекстSQL); 
	
	ТаблицаSQL= РегулярныеВыражения.ОчиститьСтрокуSQL(НайденаяТаблицаSQL);
	
	Таблица1С= Справочники.Методанные1С.НайтиПоРеквизиту("ИмяТаблицыХранения", ТаблицаSQL,, БазаДанных);
	Если ЗначениеЗаполнено(Таблица1С) Тогда
		Текст1С= СтрЗаменить(Текст1С, НайденаяТаблицаSQL, Таблица1С.Метаданные);
	КонецЕсли;  
	
	//Заменить временную талицу SQL
	Шаблон= "AS \[T\d+\]";
	НайденаяТаблицаSQL= РегулярныеВыражения.RegExp(Шаблон, ТекстSQL); 
	ВТSQL= РегулярныеВыражения.ВыделитьВТSQL(НайденаяТаблицаSQL);
	Текст1С= СтрЗаменить(Текст1С, ВТSQL, Таблица1С.Наименование);
	
	//Заменить поля SQL
	Выборка= Справочники.Поля.Выбрать(, Таблица1С);
	Пока Выборка.Следующий() Цикл                          
		Если Не ПустаяСтрока(Выборка.Наименование) Тогда
			Текст1С= СтрЗаменить(Текст1С, Выборка.ИмяХранения, Выборка.Наименование);
		КонецЕсли;
	КонецЦикла; 
	
	Если Не ПустаяСтрока(БазаДанных.ИмяSQl) Тогда 
		Текст1С= СтрЗаменить(Текст1С, "["+БазаДанных.ИмяSQl+"]", "");
	КонецЕсли;
	
	Возврат Текст1С;
КонецФункции

Функция РазобратьТекстЗапроса(ТекстSQL, БазаДанных) Экспорт
	ТаблицаСоответствия= Новый ТаблицаЗначений();
	ТаблицаСоответствия.Колонки.Добавить("ТаблицаSQL");
	ТаблицаСоответствия.Колонки.Добавить("Таблица1С");
	ТаблицаСоответствия.Колонки.Добавить("Псевдоним");
	
	ТекстДокументSQL= Новый ТекстовыйДокумент();
	ТекстДокументSQL.УстановитьТекст(ТекстSQL);
	ТекстДокумент1СТаблицы= Новый ТекстовыйДокумент();
	ТекстДокумент1СПоля= Новый ТекстовыйДокумент();

	Для НомСтроки=1 По ТекстДокументSQL.КоличествоСтрок() Цикл
		Строка1С= ТекстДокументSQL.ПолучитьСтроку(НомСтроки);
		
		ЗаменитьТаблицыSQL(Строка1С, БазаДанных, ТаблицаСоответствия);
		
		ТекстДокумент1СТаблицы.ДобавитьСтроку(Строка1С);
  	КонецЦикла;
	
//	Для НомСтроки=1 По ТекстДокумент1СТаблицы.КоличествоСтрок() Цикл
//		Строка1С= ТекстДокумент1СТаблицы.ПолучитьСтроку(НомСтроки);
//
//		ЗаменитьПоляSQL(Строка1С, БазаДанных, ТаблицаСоответствия);
//
//		ТекстДокумент1СПоля.ДобавитьСтроку(Строка1С);
//  	КонецЦикла;
	
	Текст1С= ТекстДокумент1СТаблицы.ПолучитьТекст();
	
	ЗаменитьПоляSQL(Текст1С, БазаДанных, ТаблицаСоответствия);
	
	//Если Не ПустаяСтрока(БазаДанных.ИмяSQl) Тогда 
	//		Текст1С= СтрЗаменить(Текст1С, "["+БазаДанных.ИмяSQl+"]", "");
	//КонецЕсли;	
			
	Возврат Текст1С;
КонецФункции

Процедура ЗаменитьТаблицыSQL(Строка1С, БазаДанных, ТаблицаСоответствия)
	//Заменить таблицу SQL
	Шаблон= "dbo\._\w+";
	НайденаяТаблицаSQL= РегулярныеВыражения.RegExp(Шаблон, Строка1С); 
	
	Если ПустаяСтрока(НайденаяТаблицаSQL) Тогда
		Возврат;
	КонецЕсли;
	
	ТаблицаSQL= РегулярныеВыражения.ОчиститьСтрокуSQL(НайденаяТаблицаSQL);
	
	Таблица1С= Справочники.Методанные1С.НайтиПоРеквизиту("ИмяТаблицыХранения", ТаблицаSQL,, БазаДанных);
	Если ЗначениеЗаполнено(Таблица1С) Тогда
		Строка1С= СтрЗаменить(Строка1С, НайденаяТаблицаSQL, Таблица1С.Метаданные);
	КонецЕсли;
	
	//Заменить временную талицу SQL
	Шаблон= Таблица1С.Метаданные+" T\d+";
	НайденаяТаблицаSQL= РегулярныеВыражения.RegExp(Шаблон, Строка1С); 
	Псевдоним= РегулярныеВыражения.ВыделитьПсевдонимSQL(НайденаяТаблицаSQL, Таблица1С.Метаданные);
	//Строка1С= СтрЗаменить(Строка1С, Псевдоним, Таблица1С.Наименование);

	Если Не ПустаяСтрока(ТаблицаSQL) И ЗначениеЗаполнено(Таблица1С) Тогда
		НоваяСтрока= ТаблицаСоответствия.Добавить();
		НоваяСтрока.ТаблицаSQL= ТаблицаSQL;
		НоваяСтрока.Таблица1С= Таблица1С;
		НоваяСтрока.Псевдоним= Псевдоним;	
	КонецЕсли;
КонецПроцедуры

Процедура ЗаменитьПоляSQL(Текст1С, БазаДанных, ТаблицаСоответствия)
	Для Каждого стрСоответствия ИЗ ТаблицаСоответствия Цикл
		Таблица1С= стрСоответствия.Таблица1С;
		Псевдоним= стрСоответствия.Псевдоним;

		Выборка= Справочники.Поля.Выбрать(, Таблица1С);
		Пока Выборка.Следующий() Цикл                          
			Если Не ПустаяСтрока(Выборка.Наименование) Тогда
				Текст1С= СтрЗаменить(Текст1С, Псевдоним+"."+Выборка.ИмяХранения, Псевдоним+"."+Выборка.Наименование);
			КонецЕсли;
		КонецЦикла; 
		КонецЦикла;
КонецПроцедуры