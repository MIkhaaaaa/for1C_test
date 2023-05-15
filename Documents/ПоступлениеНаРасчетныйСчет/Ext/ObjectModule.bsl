﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Хозрасчетный 
	Движения.Хозрасчетный.Записывать = Истина;
	Движение = Движения.Хозрасчетный.Добавить();
	Движение.СчетДт = ПланыСчетов.Хозрасчетный.РасчетныеСчета;
	Движение.СчетКт = ПланыСчетов.Хозрасчетный.РасчетыСПокупателями;
	Движение.Период = Дата;
	Движение.Сумма = Итого;
	Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Покупатель;
	Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Покупатель;

	// регистр Хозрасчетный 
	Движения.Хозрасчетный.Записывать = Истина;
	Движение = Движения.Хозрасчетный.Добавить();
	Движение.СчетДт = ПланыСчетов.Хозрасчетный.ВалютныеСчета;
	Движение.СчетКт = ПланыСчетов.Хозрасчетный.РасчетыСПокупателями;
	Движение.Период = Дата;
	Движение.ВалютаДт = Валюта;
	Если Валюта = Справочники.Валюты.РоссийскийРубль Тогда 
		Движение.Сумма = Итого;
	Иначе 
		Движение.ВалютнаяСуммаДт = Итого;
		Движение.Сумма = Итого * ОбработкаТабличнойЧастиСервер.ЦенаВалюты(Дата,Валюта);
	КонецЕсли;
	Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Покупатель;
	Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Покупатель;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.РеализацияТоваров") Тогда
		// Заполнение шапки
		Валюта = ДанныеЗаполнения.Валюта;
		Итого = ДанныеЗаполнения.Итого;
		Покупатель = ДанныеЗаполнения.Покупатель;
		Основание = ДанныеЗаполнения.Ссылка;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры
