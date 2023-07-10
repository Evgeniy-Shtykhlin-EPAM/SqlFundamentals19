CREATE TRIGGER [TriggerForEmployee]
	ON [dbo].[Employee]
	AFTER INSERT
	AS
	begin
		if Not Exists (select * from Company as c
		where c.AddressId = (select top(1) i.AddressId from inserted as i)
		and c.Name=(select top(1) i.CompanyName from inserted as i))

		begin
			insert into Company(Name,AddressId)
			select CompanyName, AddressId 
			from inserted
		end
	end