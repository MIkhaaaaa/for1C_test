﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//Вставить содержимое обработчика.
	//ПараметрыФормы = Новый Структура("", );
	курс = курс();
	Сообщить(курс);
КонецПроцедуры


Функция Курс()
	
	Возврат ОбработкаТабличнойЧастиСервер.ЦенаВалюты(ТекущаяДата(),Справочники.Валюты.ДолларСША);
	
КонецФункции	