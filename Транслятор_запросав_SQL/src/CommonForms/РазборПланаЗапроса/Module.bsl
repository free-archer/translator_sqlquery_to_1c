
&НаКлиенте
Процедура Разобрать(Команда)
	РазобратьНаСервере();
КонецПроцедуры
&НаСервере
Процедура РазобратьНаСервере()
	мВысотаТабличногоДокумента = ТекстSQL.ВысотаТаблицы;
	Колонка= 1;
	
	Для Строка = 2 По мВысотаТабличногоДокумента Цикл
		мСодержание = ТекстSQL.Область("R" + Формат(Строка,"ЧГ=") + "C" + Формат(Колонка,"ЧГ=")).Текст;
		
		Текст= РазборЗапросаСервер.РазобратьПланЗапроса(мСодержание, БазаДанных);
		
		Текст1С.Область("R" + Формат(Строка,"ЧГ=") + "C" + Формат(Колонка,"ЧГ=")).Текст= Текст;
	КонецЦикла;
КонецПроцедуры