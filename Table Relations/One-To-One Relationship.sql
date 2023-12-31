CREATE DATABASE [TableRelationsExercises]

CREATE TABLE [Passports] (
	[PassportID] INT PRIMARY KEY IDENTITY(101,1),
	[PassportNumber] VARCHAR(8) NOT NULL
)

CREATE TABLE [Persons] (
	[PersonID] INT PRIMARY KEY IDENTITY,
	[FirstName] VARCHAR(50) NOT NULL,
	[Salary] DECIMAL(8,2) NOT NULL,
	[PassportID] INT FOREIGN KEY REFERENCES [Passports](PassportID) UNIQUE NOT NULL
)

INSERT INTO [Passports]([PassportNumber])
	 VALUES
			('N34FG21B'),
			('K65LO4R7'),
			('ZE657QP2')

ALTER TABLE [Passports]
ADD UNIQUE ([PassportNumber]) 



