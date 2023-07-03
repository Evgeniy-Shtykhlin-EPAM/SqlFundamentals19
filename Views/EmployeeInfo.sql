CREATE VIEW [dbo].[EmployeeInfo]
	AS SELECT 
	e.Id as 'EmployeeId',
	ISNULL(e.EmployeeName, '{'+p.FirstName+'}{'+p.LastName+'}') as 'EmployeeFullName',
	'{'+a.ZipCode+'}_{'+a.State+'}, {'+ a.City+'}-{'+a.Street+'}' as 'EmployeeFullAddress',
	'{'+e.CompanyName+'} ({'+e.Position+'})' as 'EmployeeCompanyInfo'
	FROM Employee e
	join Address a on e.AddressId=a.Id
	join Person p on e.PersonId=p.Id
