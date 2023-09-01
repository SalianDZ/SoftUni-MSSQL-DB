CREATE DATABASE [Minions];

USE	[Minions];

CREATE TABLE [Minions] (
	[Id] INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	[Age] INT NOT NULL
)



CREATE TABLE [Towns] (
	[Id] INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
)

ALTER TABLE [Minions]
ADD [TownId] INT FOREIGN KEY REFERENCES [Towns] ([Id]) NOT NULL

ALTER TABLE [Minions]
ALTER COLUMN [Age] INT

GO

INSERT INTO [Towns] ([Id], [Name])
	VALUES 
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')

INSERT INTO [Minions] ([Id], [Name], [Age], [TownId])
	VALUES 
	(1, 'Kevin', 22, 1),
	(2, 'Bob', 15, 3),
	(3, 'Steward', NULL, 2  )


CREATE TABLE [People] (
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 2000000),
	[Height] DECIMAL(3, 2),
	[Weight] DECIMAL(5, 2),
	[Gender] CHAR(1) NOT NULL,
	CHECK ([Gender] = 'm' OR [Gender] = 'f'),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX)
)

INSERT INTO [People]([Name], [Height], [Weight], [Gender], [Birthdate])
	VALUES 
	('Pesho', 1.77, 75.5, 'm', '1996-05-06'),
	('Gosho', 1.45, 60.5, 'm', '2000-02-09'),
	('Maria', 1.35, 80.0, 'f', '2007-01-25'),
	('Yordan', 1.20, 20.5, 'm', '1999-05-18'),
	('Kris', 1.90, 75.1, 'm', '1991-12-09')


CREATE TABLE [Users] (
	[Id] BIGINT PRIMARY KEY IDENTITY,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	[ProfilePicture] VARBINARY,
	CHECK(DATALENGTH([ProfilePicture]) <= 900000),
	[LastLoginTime] DATETIME2,
	[IsDeleted] BIT
)

INSERT INTO [Users] ([Username], [Password], [IsDeleted])
	VALUES
	('Pesho', '12345', 0),
	('Gosho', '423455', 1),
	('Ivan', '425562r4', 1),
	('Tisho', '5ffd2', 0),
	('Petio', 'vbfdg4', 0)


ALTER TABLE [Users]
ADD CONSTRAINT [Password_Check] CHECK(DATALENGTH([Password]) >= 5)

INSERT INTO [Users] ([Username], [Password], [IsDeleted])
	VALUES
	('Test', '42556', 1)


GO

CREATE DATABASE [Movies]

USE [Movies]

CREATE TABLE [Directors] (
	[Id] INT PRIMARY KEY,
	[DirectorName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(150)
)

CREATE TABLE [Genres] (
	[Id] INT PRIMARY KEY,
	[GenreName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(150)
)

CREATE TABLE [Categories] (
	[Id] INT PRIMARY KEY,
	[CategoryName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(150)
)

CREATE TABLE [Movies] (
	[Id] INT PRIMARY KEY,
	[Title] NVARCHAR(50) NOT NULL,
	[DirectorId] INT FOREIGN KEY REFERENCES [Directors]([Id]),
	[CopyrightYear] DATE,
	[Length] NVARCHAR(20),
	[GenreId] INT FOREIGN KEY REFERENCES [Genres]([Id]),
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]),
	[Rating] INT,
	[Notes] NVARCHAR(150)
)

INSERT INTO [Directors] ([Id],[DirectorName])
	VALUES
	(1,'David Cronenberg'),
	(2,'Sidney Lumet'),
	(3,'Woody Allen'),
	(4,'Tim Burton'),
	(5,'Terry Gilliam')

INSERT INTO [Genres] ([Id],[GenreName])
	VALUES
	(1,'Action'),
	(2,'Comedy'),
	(3,'Drama'),
	(4,'Fantasy'),
	(5,'Horror')

INSERT INTO [Categories]([Id],[CategoryName])
	VALUES
	(1,'Documentary'),
	(2,'Musical'),
	(3,'Thriller'),
	(4,'Science Fiction'),
	(5,'Romance')

INSERT INTO [Movies] ([Id],[Title], [DirectorId], [CategoryId], [GenreId])
	VALUES
	(1,'Spider-Man', 1, 2, 3),
	(2,'Batman', 4, 5, 1),
	(3,'SuperMan', 1, 2, 2),
	(4,'BlueBeatle', 5, 4, 2),
	(5,'TheMeg', 5, 1, 3)

SELECT * FROM [Categories]
SELECT * FROM [Directors]
SELECT * FROM [Genres]
SELECT * FROM [Movies]


CREATE DATABASE [CarRental]

CREATE TABLE [Categories] (
	[Id] INT PRIMARY KEY,
	[CategoryName] NVARCHAR(50) NOT NULL,
	[DailyRate] INT,
	[WeeklyRate] INT,
	[MonthlyRate] INT,
	[WeekendRate] INT
)


CREATE TABLE [Cars] (
	[Id] INT PRIMARY KEY,
	[PlateNumber] NVARCHAR(30) NOT NULL,
	[Manufacturer] NVARCHAR(30) NOT NULL,
	[Model] NVARCHAR(30) NOT NULL,
	[CarYear] DATE,
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories] ([Id]) NOT NULL,
	[Doors] INT,
	[Picture] VARBINARY,
	[Condition] NVARCHAR(30) NOT NULL,
	[Available] BIT NOT NULL
)

CREATE TABLE [Employees] (
	[Id] INT PRIMARY KEY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[Title] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(150)
)

CREATE TABLE [Customers] (
	[Id] INT PRIMARY KEY,
	[DriverLicenceNumber] INT NOT NULL,
	[FullName] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50),
	[City] NVARCHAR(150) NOT NULL,
	[ZIPCode] NVARCHAR(150) NOT NULL,
	[Notes] NVARCHAR(150)
)

CREATE TABLE [RentalOrders] (
	[Id] INT PRIMARY KEY,
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
	[CustomerId] INT FOREIGN KEY REFERENCES [Customers]([Id]) NOT NULL,
	[CarId] INT FOREIGN KEY REFERENCES [Cars]([Id]) NOT NULL,
	[TankLevel] INT NOT NULL,
	[KilometrageStart] INT,
	[KilometrageEnd] INT,
	[TotalKilometrage] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[TotalDays] INT NOT NULL,
	[RateApplied] INT,
	[TaxRate] INT,
	[OrderStatus] NVARCHAR(50),
	[Notes] NVARCHAR(150)
)

INSERT INTO [Categories]([Id], [CategoryName])
	VALUES 
	(1,'Sedan'),
	(2,'HetchBack'),
	(3,'Coupe')

INSERT INTO [Cars]([Id], [PlateNumber], [Manufacturer], [Model], [CategoryId], [Condition], [Available])
	VALUES 
	(1,'PA1243HH', 'BMW', 'A5', 3, 'Good', 1),
	(2,'PA9876HH', 'Audi', '435i', 2, 'Good', 1),
	(3,'PA1653HH', 'Mercedes', 'S500', 1, 'Good', 1)

INSERT INTO [Employees]([Id], [FirstName], [LastName], [Title])
	VALUES 
	(1,'Ivan', 'Georgiev', 'Title1'),
	(2,'Blagoy', 'Petrov', 'Title2'),
	(3,'Persi', 'Stanev', 'Title3')

INSERT INTO [Customers]([Id], [DriverLicenceNumber], [FullName], [City], [ZIPCode])
	VALUES 
	(1, 5555, 'Petar Stoqtnov', 'Sofia', '0000'),
	(2, 4444, 'Georgi Paskalev', 'Plovdiv', '1111'),
	(3, 3333, 'Qvor Stanev', 'Varna', '2222')


INSERT INTO [RentalOrders]([Id], [EmployeeId], [CustomerId], [CarId], [TankLevel], [TotalKilometrage], [StartDate], [EndDate], [TotalDays])
	VALUES 
	(1, 2, 3, 2, 50, 80000, '2023-08-25', '2023-09-15', 20),
	(2, 3, 2, 1, 45, 50000, '2023-08-25', '2023-09-15', 20),
	(3, 1, 1, 3, 70, 60000, '2023-08-25', '2023-09-15', 20)


CREATE DATABASE [Hotel]

CREATE TABLE [Employees] (
	[Id] INT PRIMARY KEY,
	[FirstName] NVARCHAR(25) NOT NULL,
	[LastName] NVARCHAR(25) NOT NULL,
	[Title] NVARCHAR(50),
	[Notes] NVARCHAR(100),
)

CREATE TABLE [Customers] (
	[AccountNumber] INT PRIMARY KEY,
	[FirstName] NVARCHAR(25) NOT NULL,
	[LastName] NVARCHAR(25) NOT NULL,
	[PhoneNumber] NVARCHAR(15) NOT NULL,
	[EmergencyName] NVARCHAR(25),
	[EmergencyNumber] NVARCHAR(25),
	[Notes] NVARCHAR(100),
)


CREATE TABLE [RoomStatus] (
	[RoomStatus] NVARCHAR(30) PRIMARY KEY,
	[Notes] NVARCHAR(100),
)

CREATE TABLE [RoomTypes] (
	[RoomType] NVARCHAR(30) PRIMARY KEY,
	[Notes] NVARCHAR(100),
)

CREATE TABLE [BedTypes] (
	[BedType] NVARCHAR(30) PRIMARY KEY,
	[Notes] NVARCHAR(100),
)

CREATE TABLE [Rooms] (
	[RoomNumber] INT PRIMARY KEY,
	[RoomType] NVARCHAR(30) FOREIGN KEY REFERENCES [RoomTypes]([RoomType]) NOT NULL,
	[BedType] NVARCHAR(30) FOREIGN KEY REFERENCES [BedTypes]([BedType]) NOT NULL,
	[Rate] INT,
	[RoomStatus] NVARCHAR(30) NOT NULL,
	[Notes] NVARCHAR(100),
)

CREATE TABLE [Payments] (
	[Id] INT PRIMARY KEY,
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
	[PaymentDate] DATE,
	[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL,
	[FirstDateOccupied] DATE NOT NULL,
	[LastDateOccupied]  DATE NOT NULL,
	[TotalDays] INT,
	[AmountCharged] DECIMAL,
	[TaxRate] INT,
	[TaxAmount] INT,
	[PaymentTotal] DECIMAL NOT NULL,
	[Notes] NVARCHAR(100),
)

CREATE TABLE [Occupancies] (
	[Id] INT PRIMARY KEY,
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
	[DateOccupied] DATE NOT NULL,
	[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL,
	[RoomNumber] INT FOREIGN KEY REFERENCES [Rooms]([RoomNumber]) NOT NULL,
	[RateApplied]  INT,
	[PhoneCharge] DECIMAL,
	[Notes] NVARCHAR(100),
)

INSERT INTO [Employees] ([Id], [FirstName], [LastName])
	VALUES 
	(1,'Ivan', 'Georgiev'),
	(2,'Blagoy', 'Petrov'),
	(3,'Persi', 'Stanev')

INSERT INTO [Customers] ([AccountNumber], [FirstName], [LastName], [PhoneNumber])
	VALUES 
	(1,'David', 'Cronenberg', '0000000000'),
	(2,'Sidney', 'Lumet', '1234567891'),
	(3,'Woody', 'Allen', '1111111111')

INSERT INTO [RoomStatus] ([RoomStatus])
	VALUES 
	('Free'),
	('Taken'),
	('Not Ready')

INSERT INTO [RoomTypes] ([RoomType])
	VALUES 
	('Single'),
	('Double'),
	('Triple')

INSERT INTO [BedTypes] ([BedType])
	VALUES 
	('One'),
	('Two'),
	('Three')

INSERT INTO [Payments] ([Id], [EmployeeId], [AccountNumber], [FirstDateOccupied], [LastDateOccupied], [PaymentTotal])
	VALUES 
	(1, 1, 1, '2022-09-21', '2023-09-21', 790.50),
	(2, 2, 2, '2022-02-13', '2023-02-13', 390.50),
	(3, 3, 3, '2022-06-19', '2023-06-19', 1200.50)

INSERT INTO [Rooms] ([RoomNumber], [RoomType], [BedType], [RoomStatus])
	VALUES 
	(1, 'Single', 'One', 'Free'),
	(2, 'Double', 'Two', 'Taken'),
	(3, 'Triple', 'Three', 'Not Ready')

INSERT INTO [Occupancies] ([Id], [EmployeeId], [DateOccupied], [AccountNumber], [RoomNumber])
	VALUES 
	(1, 3, '2023-01-21', 2, 2),
	(2, 2, '2023-07-13', 3, 1),
	(3, 1, '2023-11-19', 1, 3)


CREATE DATABASE [SoftUni]

CREATE TABLE [Towns] (
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Addresses] (
	[Id] INT PRIMARY KEY IDENTITY,
	[AddressText] NVARCHAR(50) NOT NULL,
	[TownId] INT FOREIGN KEY REFERENCES [Towns]([Id]) NOT NULL
)

CREATE TABLE [Departments] (
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Employees] (
	[Id] INT PRIMARY KEY IDENTITY,
	[FirstName] NVARCHAR(25) NOT NULL,
	[MiddleName] NVARCHAR(25) NOT NULL,
	[LastName] NVARCHAR(25) NOT NULL,
	[JobTitle] NVARCHAR(25) NOT NULL,
	[DepartmentId] INT FOREIGN KEY REFERENCES [Departments]([Id]) NOT NULL,
	[HireDate] DATE,
	[Salary] DECIMAL,
	[AddressId] INT FOREIGN KEY REFERENCES [Addresses]([Id]) NOT NULL
)

INSERT INTO [Towns] ([Name])
	VALUES 
	('Sofia'),
	('Plovdiv'),
	('Varna'),
	('Burgas')

	INSERT INTO [Addresses] ([AddressText], [TownId])
	VALUES 
	('Sofia', 1),
	('Plovdiv', 2),
	('Varna', 3),
	('Burgas', 4)

INSERT INTO [Departments] ([Name])
	VALUES 
	('Engineering'),
	('Sales'),
	('Marketing'),
	('Software Development'),
	('Quality Assurance')

INSERT INTO [Employees] ([FirstName], [MiddleName], [LastName], [JobTitle], [DepartmentId], [HireDate], [Salary], [AddressId])
	VALUES 
	('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00, 1),
	('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00, 1),
	('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25, 2),
	('Georgi ', 'Teziev ', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00, 3),
	('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88, 4)

SELECT * FROM [Towns]
SELECT * FROM [Departments]
SELECT * FROM [Employees]

SELECT * FROM [Towns] ORDER BY [Name] ASC 
SELECT * FROM [Departments] ORDER BY [Name] ASC 
SELECT * FROM [Employees] ORDER BY [Salary] DESC
