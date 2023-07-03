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
    if 
        (SELECT TRIM(@EmployeeName) AS TrimmedString) is null
    AND (SELECT TRIM(@FirstName) AS TrimmedString) is null
    AND (SELECT TRIM(@LastName) AS TrimmedString) is null
    BEGIN  
       PRINT 'Name or FirstName or Last name should be fill'  
    END

    else if(len(@CompanyName)>20)
    BEGIN  
    DECLARE @Tempcompany NVARCHAR(20)=@CompanyName
        INSERT into Employee(EmployeeName,Position,CompanyName)
        values
        (@EmployeeName,@Position,@Tempcompany)
        INSERT into Person(FirstName,LastName)
        values
        (@FirstName,@LastName)
        INSERT into Address(Street,City,State,ZipCode)
        values
        (@Street,@City,@State,@ZipCode)
    END

    else
    BEGIN  
        INSERT into Employee(EmployeeName,Position,CompanyName)
        values
        (@EmployeeName,@Position,@CompanyName)
        INSERT into Person(FirstName,LastName)
        values
        (@FirstName,@LastName)
        INSERT into Address(Street,City,State,ZipCode)
        values
        (@Street,@City,@State,@ZipCode)
    END