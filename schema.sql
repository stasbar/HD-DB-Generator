/*
DROP TABLE IF EXISTS SubjectKlassRel
DROP TABLE IF EXISTS SubjectTeacherRel
DROP TABLE IF EXISTS Subject
DROP TABLE IF EXISTS Class
DROP TABLE IF EXISTS Teacher
DROP TABLE IF EXISTS Grade
DROP TABLE IF EXISTS Student
DROP TABLE IF EXISTS Exam
*/
CREATE TABLE Subject
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
)
CREATE TABLE Teacher
(
    PESEL varchar(11) NOT NULL PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Surname varchar(100) NOT NULL,
    Title varchar(100) NOT NULL,
    StartWorkingDate_Year INTEGER NOT NULL,
    ExperienceYears INTEGER NOT NULL,
    Supervisor_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Teacher,
    Subject_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Subject,
)
CREATE TABLE Class
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    Sign varchar(1) NOT NULL,
    Tutor_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Teacher,
    OriginYear INTEGER NOT NULL,
)
CREATE TABLE Student
(
    PESEL varchar(11) NOT NULL PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Surname varchar(40) NOT NULL,
    Class_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Class,
    Supervisor_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Student,
    GimScore INTEGER NOT NULL
)
CREATE TABLE Grade
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    Year INTEGER NOT NULL,
    Grade FLOAT NOT NULL,
    Subject_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Subject,
    Teacher_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Teacher,
    Student_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Student,
)
CREATE TABLE Exam
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    Result FLOAT NOT NULL,
    Year INTEGER NOT NULL,
    Student_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Student,
    Subject_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Subject,
    Teacher_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Teacher,
)
CREATE TABLE SubjectTeacherRel
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    Subject_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Subject,
    Teacher_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Teacher,
)
CREATE TABLE SubjectKlassRel
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    Subject_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Subject,
    Class_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Class,
    Teacher_PESEL varchar(11) NOT NULL FOREIGN KEY REFERENCES Teacher,
)
