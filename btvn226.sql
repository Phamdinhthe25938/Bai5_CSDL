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
ALTER TABLE Student
  DROP COLUMN studentStatus; 
drop table student;
create table StudentTest(
     studentRN int,
     testID int,
     dateTest date,
     mark float,
     primary key (studentRN,testID),
     foreign key (studentRN) references Student(studentRN),
	foreign key (testID) references test(testID)
);
drop table studenttest;
-- cau 2:
 select Student.studentName,NameTest,mark,StudentTest.dateTest from Student  join StudentTest  on Student.studentRN=StudentTest.studentRN    join 
 test  on   test.testID=StudentTest.testID ;
-- cau3:
	select studentName,studentAge from  student left join  StudentTest  on Student.studentRN=StudentTest.studentRN where testID is null;

select studentName,studentAge from  student as s where s.studentRN not in (select s1.studentRN from studenttest as s1);
--  cau 4:
 select Student.studentName,mark,StudentTest.dateTest from StudentTest  join   test on test.testID=StudentTest.testID   join 
 student  on Student.studentRN=StudentTest.studentRN where mark<5 ;
 --  cau 5:
 create view Diemtb_view as
 select Student.studentName,avg(mark) as Diemtb  from StudentTest   join 
 student  on Student.studentRN=StudentTest.studentRN group by studentName order by avg(mark) desc;
 select * from Diemtb_view;
  -- cau6:
  select * from Diemtb_view where Diemtb = (select max(Diemtb) from Diemtb_view) ;
  --  cau 7:
select NameTest,max(mark) from StudentTest  join   test    
  on test.testID=StudentTest.testID group by NameTest ;
  -- cau 8:
   select Student.studentName,NameTest from StudentTest  join 
 test  on  test.testID=StudentTest.testID  right  join Student    on Student.studentRN=StudentTest.studentRN ;
 -- cau 9:
 update student set studentAge =studentAge+1 where studentRN>0;
 -- cau 10:
 ALTER TABLE Student
  add  COLUMN studentStatus varchar(20); 
  -- cau 11:
  update student set  studentStatus ="young" where (studentRN>0 and  studentAge<=30);
  update student set studentStatus ="old" where (studentRN>0 and  studentAge>30) ;
-- cau 12:
create view studentList as 
select studentName,NameTest,mark,dateTest from 
 Student  join StudentTest  on Student.studentRN=StudentTest.studentRN    join 
 test  on   test.testID=StudentTest.testID order by (dateTest);
 select * from studentList;
 -- cau 13:
 DROP Trigger tgSetStatus1;
DELIMITER //
CREATE TRIGGER  tgSetStatus1 BEFORE INSERT
ON Student  
FOR EACH ROW
BEGIN
IF NEW.studentAge<30 THEN
	SET NEW.studentStatus='Young';
ELSE 
	SET NEW.studentStatus='Old';
END IF;
END// 
DELIMITER ;
insert into Student values(6,"NGuyen Hong Anh",20,1);
 
 