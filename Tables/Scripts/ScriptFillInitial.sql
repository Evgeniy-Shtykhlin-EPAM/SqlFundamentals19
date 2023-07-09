Use SqlFundamentals19DB;

INSERT into Person (FirstName, LastName)
VALUES 
('Ivan', 'Ivanov'),
('Joe', 'Smith'),
('Shipra', 'Verma');
Insert into Address (Street, City,State,ZipCode)
Values
('Buhar', 'Astana', 'Aqmolinskaya','101500'),
('Bokei-Han', 'Almaaty', 'Almaatinskaya','101600'),
('Gogol', 'Karagandy', 'Karagandinskaya','101700');
INSERT into Company(Name,AddressId)
VALUES 
('Epam',1),
('Sulpak',2),
('Techodom',3);
INSERT into Employee(AddressId,PersonId,CompanyName,Position,EmployeeName)
VALUES 
(1, 1,'Epam','Junior dev','Ivan'),
(2, 2,'Sulpak','Middle dev','Joe'),
(3, 3,'Techodom','Senior dev','Shipra');
