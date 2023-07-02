/*CREATE TRIGGER [TriggerForEmployee]
	ON [dbo].[Employee]
	AFTER INSERT
	AS
		insert into Company(Name,AddressId)
		values((select i.CompanyName from inserted i),(select i.AddressId from inserted i));*/

--я пробовал с этим тригером, не получается если знаешь в чем ошибка подскажи