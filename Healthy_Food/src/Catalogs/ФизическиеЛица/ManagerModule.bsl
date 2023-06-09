#Если Сервер ИЛИ ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

Функция ПолучитьВозраст(ФизическоеЛицо) Экспорт
	
	ДатаРождения = ОбщегоНазначения.ЗначениеРеквизитаОбъекта(ФизическоеЛицо, "ДатаРождения");
	
	Возврат ПолучитьРазностьДат(НачалоДня(ТекущаяДатаСеанса()), ДатаРождения);	
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьРазностьДат(НачалоПериода, КонецПериода)
 
 	Запрос = Новый Запрос;
 	Запрос.Текст =
  	"ВЫБРАТЬ
  	| РАЗНОСТЬДАТ(&ДатаНачалаПериода, &ДатаОкончанияПериода, ГОД) КАК Результат";
 
 	Запрос.УстановитьПараметр("ДатаНачалаПериода",  НачалоДня(НачалоПериода));
 	Запрос.УстановитьПараметр("ДатаОкончанияПериода", НачалоДня(КонецПериода));
 
 	РезультатЗапроса = Запрос.Выполнить();
 
 	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
 
 	КоличествоЛет = 0;
 	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
  		КоличествоЛет = ВыборкаДетальныеЗаписи.Результат;
 	КонецЦикла;
 
 	Возврат КоличествоЛет;
 
КонецФункции

#КонецОбласти
	
#КонецЕсли