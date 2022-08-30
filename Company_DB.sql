show databases;
create database company;
Use company;
create table Employee(FName varchar(15) NOT NULL, MName varchar(15) NOT NULL, LNAme varchar(15) NOT NULL, SSN int(15) NOT NULL, BDate Date NOT NULL, Address varchar(55) NOT 
NULL, Gender varchar(7) check(Gender= "male" or Gender="Female"), Salary Int(10) NOT NULL, SUP_SSN Int(25) NOT NULL, DNumber Int(30) NOT NULL, foreign key(DNumber) references 
Department(DNO));
create table Department(DName varchar(30) NOT NULL, DNO Int(30) Primary key, MGR_SSN varchar(20) NOT NULL, MGR_Start_Date Date NOT NULL);
create table Depa_Location(DNumber Int(30) NOT NULL, DLocation varchar(40) NOT NULL, foreign key(DNumber) references Department(DNO));
create table Project(PName varchar(15) NOT NULL, PNumber Int(10) Primary key, PLocation varchar(40) NOT NULL, DNum Int(30) NOT NULL, foreign key(DNum) references Department(DNO));
create table Work_On(ESSN Int(15) Primary key, PNO Int(10) NOT NULL, Hours Int(5) NOT NULL, foreign key(PNO) references Project(PNumber));
create table Dependent(Emp_SSN Int(15) not null, Dep_Name varchar(40), Gender varchar(7) check(Gender= "male" or Gender="Female"), BDate Date NOT NULL, Relationship varchar(20), 
Foreign key(Emp_SSN) references Work_On(ESSN));
Desc Department;
Insert into Department values("Development", 9, 413, "2020-06-13");
Insert into Department values("Manegment", 5, 410, "2015-02-10");
Insert into Department values("Tranee", 6, 411, "2017-12-24");
Insert into Department values("Research", 7, 412, "2018-11-19");
Insert into Department values("Research", 8, 412, "2018-11-19");
Insert into Department values("Testing", '4', '409', "2015-09-30");
Select*from Department;
Select count(*) from Department;
Desc Employee;
Insert into Employee values("Pooja", "Jaykant", "Mishra", 420, "1998-04-17", "Chandrapur", "Female", 12000, 1001, 6);
Insert into Employee values("Jay", "Shalik", "Gurunule", 421, "1999-08-22", "Maroda", "Male", 15000, 1002, 7);
Insert into Employee values("Ankush", "Puroshtam", "garghate", 422, "1999-07-13", "Pombhurna", "Male", 13000, 1003, 5);
Insert into Employee values("Aniket", "Avinash", "Mudawar", 423, "1997-03-11", "Maroda", "Male", 40000, 1004, 9);
Insert into Employee values("Hemangi", "Pramod", "Wasekar", 424, "1997-06-23", "Chandrapur", "Female", 17000, 1005, 8);
Insert into Employee values("Puja", "Ramakant", "Verma", 420, "2000-05-01", "Chandrapur", "Female", 10000, 1000, 4);
select*from Employee;
Select count(*) from Employee;

Desc Depa_Location;
Insert into Depa_Location values(4, "Sarola");
Insert into Depa_Location values(5, "Nashik");
Insert into Depa_Location values(6, "Goindia");
Insert into Depa_Location values(7, "Hedrabad");
Insert into Depa_Location values(8, "chennai");
Insert into Depa_Location values(9, "Waranshi");
select*from Depa_Location;
Select count(*) from Depa_Location;

Desc Project;
Insert into Project values("Moving Birds", 524, "Kolkata", 5);
Insert into Project values("Leadership", 525, "Ajaypur", 6);
Insert into Project values("Coding Reasons", 526, "Newyork", 7);
Insert into Project values("Arts Codes", 527, "Gondiya", 8);
Insert into Project values("Mars Mission", 528, "China", 9);
Insert into Project values("TV Kit", 529, "Sarola", 4); 
select*from Project;
Select count(*) from Project;

Desc Work_On;
Insert into Work_On values(604, 524, 5);
Insert into Work_On values(605, 525, 8);
Insert into Work_On values(606, 526,  65);
Insert into Work_On values(607, 527, 75);
Insert into Work_On values(608, 528, 86);
Insert into Work_On values(609, 529, 859);
select*from Work_On;
Select count(*) from Work_On;

Desc Dependent;
Insert into Dependent values(604, "Rakesh", "Female", "2000-05-01", "Employee");
Insert into Dependent values(605, "Ashwin", "Male", "1997-11-03", "Projecr Maneger");
Insert into Dependent values(606, "Kishori", "Female", "1984-08-29", "Dealer");
Insert into Dependent values(607, " ", "Male", "1992-04-22", "Executive");
Insert into Dependent values(608, "Ashwini", "Female", "2002-12-21", "Depa_Head");
Insert into Dependent values(609, " ", "Female", "1999-11-24", "Executive");
select*from Dependent;
Select count(*) from Dependent;

select PName from Project where DNum=4;
Select FName, MName, LName from Department As D join Employee As E on E.DNumber=D.DNO Where DName="Research";
Select (Salary*10/100)+salary As Incre_Salary from Department As D join Employee As E on E.DNumber=D.DNO Where DName="Research";
select *from employee where salary=(select Max(salary) from employee);
select *from employee order by salary desc limit 1,1;
select*from employee where BDate between "1989-01-01" and "1989-12-01";
select FName, MName, LName, Dep_Name from Employee As E join Project As P on P.DNum=E.DNumber 
													 join Work_On As W on P.PNumber=W.PNO
													 join Dependent As D on W.ESSN=D.Emp_SSN
                                                     Where Dep_Name="null";
update Dependent set Relationship="Project Maneger" where BDate="1997-11-03";
Select FName, Dep_Name from Employee As E join Project As P on P.DNum=E.DNumber 
								 join Work_On As W on P.PNumber=W.PNO
								 join Dependent As D on W.ESSN=D.Emp_SSN
                                 where FName like'A%' and Dep_Name like 'A%';
                                                     