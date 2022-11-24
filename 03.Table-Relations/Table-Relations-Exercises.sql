CREATE DATABASE EntityRelations
USE EntityRelations

CREATE TABLE Persons
(
 PersonID INT NOT NULL,
 FirstName NVARCHAR(30) NOT NULL,
 Salary DECIMAL(7,2) NOT NULL,
 PassportID INT NOT NULL
)

CREATE TABLE Passports
(
 PassportID INT IDENTITY(101,1),
 PassportNumber NVARCHAR(50) NOT NULL,
)

INSERT INTO Persons
VALUES(1,'Roberto',43300.00,102),(2,'Tom',56100.00,103),(3,'Yana',60200.00,101)

INSERT INTO Passports
VALUES ('N34FG21B'),('K65LO4R7'),('ZE657QP2')

ALTER TABLE Persons
ADD PRIMARY KEY(PersonID)

ALTER TABLE Passports
ADD PRIMARY KEY(PassportID)


ALTER TABLE Persons
ADD FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)


CREATE TABLE Models
(
 ModelID INT NOT NULL IDENTITY(101,1),
 [Name] NVARCHAR(30) NOT NULL,
 ManufacturerID INT NOT NULL
 )

 CREATE TABLE Manufacturers
 (
  ManufacturerID INT IDENTITY,
  [Name] NVARCHAR(30) NOT NULL,
  EstablishedOn DATE NOT NULL
 )

 INSERT INTO Models
 VALUES ('X1',1), ('i6',1),('Model S',2), ('Model X',2), ('Model 3',2), ('Nova',3)

 INSERT INTO Manufacturers
 VALUES ('BMW',	'1916/03/07'), ('Tesla','2003/01/01'),('Lada','1966/05/01')

 ALTER TABLE Models
 ADD PRIMARY KEY(ModelID)

 ALTER TABLE Manufacturers
 ADD PRIMARY KEY(ManufacturerID)

 ALTER TABLE Models
 ADD FOREIGN KEY(ManufacturerID) REFERENCES Manufacturers(ManufacturerID)


 CREATE TABLE Students
 (
 StudentID INT NOT NULL IDENTITY,
 [Name] NVARCHAR(30) NOT NULL,
 )

 CREATE TABLE Exams
 (
 ExamID INT NOT NULL IDENTITY(101,1),
 [Name] NVARCHAR(30) NOT NULL,
 )

 CREATE TABLE StudentsExams
 (
  StudentID INT NOT NULL,
  ExamID INT NOT NULL,
 )


 INSERT INTO Students
 VALUES ('Mila'),('Toni'), ('Ron')

 INSERT INTO Exams
 VALUES ('SpringMVC'),('Neo4j'), ('Oracle 11g')

 INSERT INTO StudentsExams
 VALUES (1,101),(1,102), (2,101), (3,103), (2,102), (2,103)

 ALTER TABLE Students
 ADD PRIMARY KEY (StudentID)

 ALTER TABLE Exams
 ADD PRIMARY KEY (ExamID)

 ALTER TABLE StudentsExams
 ADD CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID,ExamID)

 ALTER TABLE StudentsExams
 ADD CONSTRAINT FK_StudentsExams 
 FOREIGN KEY(StudentID) REFERENCES Students(StudentID), 
 FOREIGN KEY(ExamID) REFERENCES Exams(ExamID)

 CREATE TABLE Teachers
 (
  TeacherID INT NOT NULL IDENTITY(101,1),
  [Name] NVARCHAR(30) NOT NULL,
  ManagerID INT
 )

INSERT INTO Teachers
VALUES ('John',NULL), ('Maya',106),('Silvia',106),('Ted',105),('Mark',101),('Greta',101)

ALTER TABLE Teachers
ADD PRIMARY KEY(TeacherID)

ALTER TABLE Teachers
ADD FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)


CREATE DATABASE OnlineStore
USE OnlineStore

CREATE TABLE Cities
(
CityID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL
)


CREATE TABLE ItemTypes
(
ItemTypeID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Items
(
ItemID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL,
ItemTypeID INT NOT NULL,
FOREIGN KEY(ItemTypeID) REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL,
Birthday DATE NOT NULL,
CityID INT NOT NULL,
FOREIGN KEY(CityID) REFERENCES Cities(CityID)
)

CREATE TABLE Orders
(
OrderID INT PRIMARY KEY NOT NULL,
CustomerID INT NOT NULL,
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems
(
OrderID INT NOT NULL,
ItemID INT NOT NULL,
CONSTRAINT PK_OrderItems PRIMARY KEY(OrderID,ItemID),
CONSTRAINT FK_OrderItems 
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID), FOREIGN KEY(ItemID) REFERENCES Items(ItemID)
)


CREATE DATABASE SoftUni
USE SoftUni

CREATE TABLE Majors
(
MajorID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL,
)

CREATE TABLE Subjects
(
 SubjectID INT PRIMARY KEY NOT NULL,
 SubjectName VARCHAR(50) NOT NULL,
)

CREATE TABLE Students
(
 StudentID INT PRIMARY KEY NOT NULL,
 StudentNumber INT NOT NULL,
 StudentName VARCHAR(50) NOT NULL,
 MajorID INT NOT NULL,
 FOREIGN KEY(MajorID) REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
 PaymentID INT PRIMARY KEY NOT NULL,
 PaymentDate DATE NOT NULL,
 PaymentAmount NVARCHAR(200) NOT NULL,
 StudentID INT NOT NULL,
 FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
)


CREATE TABLE Agenda
(
StudentID INT NOT NULL,
SubjectID INT NOT NULL,
CONSTRAINT PK_Agenda PRIMARY KEY(StudentID,SubjectID),
CONSTRAINT FK_Agenda 
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID)
)

--PO9

USE Geography

SELECT MountainRange,PeakName,Elevation FROM Mountains
JOIN Peaks ON Mountains.Id=Peaks.MountainId
WHERE MountainRange='Rila'
ORDER BY Elevation DESC