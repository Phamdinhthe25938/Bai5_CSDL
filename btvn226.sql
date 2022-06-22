use btnvn226;

Create table test(
   testID int primary key,
   NameTest varchar(50)
);
create table Student(
     studentRN int primary key,
     studentName varchar(50),
     studentAge int ,
     studentStatus bit
);
create table StudentTest(
     testID int,
     studentRN int,
     dateTest date,
     mark float,
     foreign key (studentRN) references Student(studentRN),
	foreign key (testID) references test(testID)
);