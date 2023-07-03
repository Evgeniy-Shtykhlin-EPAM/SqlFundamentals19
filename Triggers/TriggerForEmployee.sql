CREATE TRIGGER [TriggerForEmployee]
	ON [dbo].[Employee]
	AFTER INSERT
	AS
		insert into Company(Name,AddressId)
		select CompanyName, AddressId 
		from inserted
