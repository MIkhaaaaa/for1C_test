﻿Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	Итого = Товары.Итог("Сумма");
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	// регистр Хозрасчетный 
	Движения.Хозрасчетный.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Хозрасчетный.Добавить();
		Движение.СчетДт = ПланыСчетов.Хозрасчетный.ТоварыНаСкладах;
		Движение.СчетКт = ПланыСчетов.Хозрасчетный.РасчетыСПоставщиками;
		Движение.Период = Дата;
		Движение.КоличествоДт = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Номенклатура] = ТекСтрокаТовары.Номенклатура;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Склад] = Склад;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Партия] = Ссылка;
		Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Поставщик;
	КонецЦикла;
		
	     ОбработкаПроведенияОУ ()

КонецПроцедуры





Процедура ОбработкаПроведенияОУ ()
	// регистр ТоварыНаСкладах Приход

	Движения.ТоварыНаСкладах.Записывать = Истина;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПоступлениеТоваровТовары.Цена КАК Цена,
		|	СУММА(ПоступлениеТоваровТовары.Количество) КАК Количество,
		|	СУММА(ПоступлениеТоваровТовары.Сумма) КАК Сумма
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
		|ГДЕ
		|	ПоступлениеТоваровТовары.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	ПоступлениеТоваровТовары.Номенклатура,
		|	ПоступлениеТоваровТовары.Цена";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		
		Движение = Движения.ТоварыНаСкладах.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = Выборка.Номенклатура;
		Движение.Склад = Склад;
		Движение.Партия = Ссылка;
		Движение.Количество = Выборка.Количество;
		Движение.Стоимость = Выборка.Сумма;
	КонецЦикла;
	
КонецПроцедуры