CREATE PROCEDURE [dbo].[sp_AddEmployee]
	@EmployeeName nvarchar(100)= NULL,
    @FirstName nvarchar(50)= NULL,
    @LastName nvarchar(50)= NULL,
	@CompanyName nvarchar(30),
    @Position nvarchar(30) = '',
    @Street nvarchar(50),
    @City nvarchar(50) = '',
	@State nvarchar(20)= '',
    @ZipCode nvarchar(20)= ''
AS
    if (@EmployeeName IS NULL AND @FirstName IS NULL AND @LastName IS NULL)
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