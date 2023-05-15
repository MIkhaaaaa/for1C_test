﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ПоступлениеТоваров") Тогда
		// Заполнение шапки
		Валюта = ДанныеЗаполнения.Валюта;
		Итого = ДанныеЗаполнения.Итого;
		Получатель = ДанныеЗаполнения.Поставщик;
		Основание = ДанныеЗаполнения.Ссылка;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	
	// регистр Хозрасчетный 
	Если ЭтотОбъект.Валюта = Справочники.Валюты.РоссийскийРубль Тогда
		Движения.Хозрасчетный.Записывать = Истина;
		Движение = Движения.Хозрасчетный.Добавить();
		Движение.СчетДт = ПланыСчетов.Хозрасчетный.РасчетыСПоставщиками;
		Движение.СчетКт = ПланыСчетов.Хозрасчетный.РасчетныеСчета;
		Движение.Период = Дата;
		Движение.Сумма = Итого;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Получатель;
		Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Получатель;
	Иначе
		// регистр Хозрасчетный 
		Движения.Хозрасчетный.Записывать = Истина;
		Движение = Движения.Хозрасчетный.Добавить();
		Движение.СчетДт = ПланыСчетов.Хозрасчетный.РасчетыСПоставщиками;
		Движение.СчетКт = ПланыСчетов.Хозрасчетный.ВалютныеСчета;
		Движение.Период = Дата;
		Движение.ВалютаКт = Валюта;
		Если Валюта = Справочники.Валюты.РоссийскийРубль Тогда 
			Движение.Сумма = Итого;
		Иначе 
			Движение.ВалютнаяСуммаКт = Итого;
			Движение.Сумма = Итого * ОбработкаТабличнойЧастиСервер.ЦенаВалюты(Дата,Валюта);
		КонецЕсли;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Получатель;
		Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Получатель;
	КонецЕсли;
	
КонецПроцедуры
