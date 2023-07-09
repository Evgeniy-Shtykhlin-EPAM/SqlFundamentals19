CREATE PROCEDURE [dbo].[sp_AddEmployee]
    @CompanyName nvarchar(30),
    @Street nvarchar(50),
	@EmployeeName nvarchar(100)= NULL,
    @FirstName nvarchar(50)= NULL,
    @LastName nvarchar(50)= NULL,
    @Position nvarchar(30) =NULL,
    @City nvarchar(50) = NULL,
    @State nvarchar(20)= NULL,
    @ZipCode nvarchar(20)= NULL
AS
    DECLARE @Tempcompany NVARCHAR(20)=@CompanyName

    if 
        (SELECT TRIM(@EmployeeName) AS TrimmedString) is null
    AND (SELECT TRIM(@FirstName) AS TrimmedString) is null
    AND (SELECT TRIM(@LastName) AS TrimmedString) is null
    BEGIN  
       PRINT 'EmployeeName or FirstName or LastName should be fill'
    END
     else
        BEGIN
            if  
                (SELECT TRIM(@FirstName) AS TrimmedString) is not null
                OR (SELECT TRIM(@LastName) AS TrimmedString) is not null
             BEGIN

                INSERT into Person(FirstName,LastName)
                values
                (@FirstName,@LastName)

                INSERT into Address(Street,City,State,ZipCode)
                values
                (@Street,@City,@State,@ZipCode)

                

                INSERT into Employee(AddressId,PersonId,EmployeeName,Position,CompanyName)
                values
                ((select top(1) a.Id from Address as a 
                where a.Street=@Street and a.City=@City and a.State=@State and a.ZipCode=@ZipCode),
                (select top(1) p.Id from Person as p
                where p.FirstName=@FirstName and p.LastName=@LastName),
                @EmployeeName,@Position,@Tempcompany);

             END
             else
                PRINT 'Cannot create Person First Name and Last Name is absent'
        END