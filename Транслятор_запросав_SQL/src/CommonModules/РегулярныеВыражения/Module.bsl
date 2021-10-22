
Функция ПроверитьСтроку(Строка, Фасет) Экспорт
    Чтение = Новый ЧтениеXML;
    Чтение.УстановитьСтроку(
                "<Model xmlns=""http://v8.1c.ru/8.1/xdto"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xsi:type=""Model"">
                |<package targetNamespace=""sample-my-package"">
                |<valueType name=""testtypes"" base=""xs:string"">
                |<pattern>" + Фасет + "</pattern>
                |</valueType>
                |<objectType name=""TestObj"">
                |<property xmlns:d4p1=""sample-my-package"" name=""TestItem"" type=""d4p1:testtypes""/>
                |</objectType>
                |</package>
                |</Model>");

    Модель = ФабрикаXDTO.ПрочитатьXML(Чтение);
    МояФабрикаXDTO = Новый ФабрикаXDTO(Модель);
    Пакет = МояФабрикаXDTO.Пакеты.Получить("sample-my-package");
    Тест = МояФабрикаXDTO.Создать(Пакет.Получить("TestObj"));

    Попытка
        Тест.TestItem = Строка;
        Возврат Истина
    Исключение
        Возврат Ложь
    КонецПопытки;
    
КонецФункции
    