﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ВидыУчетаСебестоимости
	Движения.ВидыУчетаСебестоимости.Записывать = Истина;
	Движение = Движения.ВидыУчетаСебестоимости.Добавить();
	Движение.Период = Дата;
	Движение.УчетСебестоимости = МетодСписанияСебестоимости;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
