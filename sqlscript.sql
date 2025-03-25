REM   Script: Hospital Database
REM   Database Project

create table Department (   
  Dnumber        int,     
  Dname          varchar(50),   
  DEmail         varchar(200),   
  Floor_number   int,   
  Phone_number   varchar(10),    
 primary key (Dnumber)     
) 
;

create table Person (   
  SSN                 int,     
  First_name          varchar(50),   
  Middle_initial       varchar(50),   
  Last_name            varchar(50),   
  Phone_number         varchar(10),   
  Email                varchar(200),   
  Date_of_birth        date,   
 primary key (SSN)     
) 
 
;

create table Staff (  
  Ssn                 int,    
  salary            decimal,  
  deptNum              int,  
primary key (Ssn), 
foreign key (Ssn) references Person (SSN),  
foreign key (deptNum) references Department (DNumber)  
) 
 
 
;

create table Doctor (   
  Ssn                 int,     
  specialty            varchar(10),   
  deptNum              int,   
 primary key (Ssn),  
 foreign key (Ssn) references Person (SSN),  
 foreign key (deptNum) references Department (DNumber)  
) 
 
;

create table Nurse (   
  Ssn                 int,     
  position            varchar(10),   
 primary key (Ssn),  
 foreign key (Ssn) references Person (SSN)     
) 
 
 
;

create table Room (   
  Num        int,     
  nurseSSN   int not null,   
primary key (Num), 
foreign key (nurseSSN) references Person (SSN) 
) 
 
 
 
;

create table Prescription (   
  ID         int,     
  PDate       date,   
  doctorSSN   int,  
  primary key (ID),  
  foreign key (doctorSSN) references Person (SSN)  
) 
 
 
 
;

create table Patient (     
  SSN         int,       
  fileNum     int,    
  visit_date  date,    
  visit_time  varchar(8),    
  entry_date  date,    
  entry_time  varchar(8),    
  doctorSSN   int,    
  roomNum     int,    
  lengthOfStay int,    
 primary key (SSN),   
 foreign key (SSN) references Person (SSN),    
 foreign key (doctorSSN) references Person (SSN),    
 foreign key (roomNum) references Room (Num)    
) 
 
 
 
 
;

create table Appointment (  
  Code         int,       
  Adate        date,    
  Atime        varchar(8),    
  patientSSN   int,    
  doctorSSN    int,    
 primary key (Code),   
 foreign key (patientSSN) references Person (SSN),    
 foreign key (doctorSSN) references Person (SSN)  
) 
 
 
 
 
 
;

insert into Department (Dnumber,Dname,DEmail,Floor_number,Phone_number) values 
   (1,'Emergency department','emergency@gmail.com',1,'0598388754');

insert into Department (Dnumber,Dname,DEmail,Floor_number,Phone_number) values 
   (2,'Dermatology department','Dermatology@gmail.com',2,'0565437896');

insert into Department (Dnumber,Dname,DEmail,Floor_number,Phone_number) values 
   (3,'Maternity department','maternity@gmail.com',5,'0565437897');

insert into Person (SSN,First_name,Middle_initial,Last_name,Phone_number,Email,Date_of_birth) values 
   (1,'Alanoud','Mohammed','Saad','0598554435','alanoud@gmail.com',Date'1980-01-10');

insert into Person (SSN,First_name,Middle_initial,Last_name,Phone_number,Email,Date_of_birth) values 
   (2,'Amal','Ali','Salim','0533456765','Amal@gmail.com',Date'2000-04-15');

insert into Person (SSN,First_name,Middle_initial,Last_name,Phone_number,Email,Date_of_birth) values 
   (3,'Abdullah','Ibrahim','Majid','0543567789','Abdu@gmail.com',Date'1967-03-11');

insert into Person (SSN,First_name,Middle_initial,Last_name,Phone_number,Email,Date_of_birth) values 
   (4,'Lama','Ahmed','Ali','0565478893','Lama@gmail.com',Date'1985-04-20');

insert into Person (SSN,First_name,Middle_initial,Last_name,Phone_number,Email,Date_of_birth) values 
   (5,'Fahad','Khalid','Hashim','0533456765','Fahad@gmail.com',Date'1997-08-12');

insert into Person (SSN,First_name,Middle_initial,Last_name,Phone_number,Email,Date_of_birth) values 
   (6,'Basma','Mubarak','Waleed','0543567789','Abdu@gmail.com',Date'1989-12-11');

select * from Person;

insert into Staff (Ssn,salary,deptNum) values 
   (1,16000,1);

insert into Staff (Ssn,salary,deptNum) values 
   (2,25000,3);

insert into Staff (Ssn,salary,deptNum) values 
   (3,6000,2);

select * from Person;

insert into Doctor(Ssn,specialty,deptNum) values 
   (1,'specialist',1);

insert into Doctor (Ssn,specialty,deptNum) values 
   (2,'Advisor',2);

insert into Doctor (Ssn,specialty,deptNum) values 
   (3,'Pediatric',2);

select * from Doctor;

insert into Nurse(Ssn,position) values 
   (1,'assistant');

insert into Nurse (Ssn,position) values 
   (2,'nurse');

insert into Nurse(Ssn,position) values 
   (3,'neonatal');

select * from Nurse;

insert into Room(Num,nurseSSN) values 
   (1,2);

insert into Room(Num,nurseSSN) values 
   (2,3);

insert into Room(Num,nurseSSN) values 
   (3,3);

select * from Room;

insert into Prescription(ID,PDate,doctorSSN) values 
   (1,Date'2023-01-10',2);

insert into Prescription(ID,PDate,doctorSSN) values 
   (2,Date'2023-05-23',3);

insert into Prescription(ID,PDate,doctorSSN) values 
   (3,Date'2023-09-03',1);

select * from Prescription;

insert into Patient(SSN,fileNum,visit_date,visit_time,doctorSSN) values 
   (1,1,Date'2020-01-10','10:30:08',2);

insert into Patient(SSN,fileNum,entry_date,entry_time,doctorSSN,roomNum,lengthOfStay) values 
   (2,2,Date'2023-01-10','01:00:08',3,1,2);

insert into Patient(SSN,fileNum,visit_date,visit_time,doctorSSN) values 
   (3,3,Date'2023-5-5','12:30:08',2);

insert into Patient(SSN,fileNum,visit_date,visit_time,doctorSSN) values 
   (4,4,Date'2023-05-15','10:30:08',3);

insert into Patient(SSN,fileNum,entry_date,entry_time,doctorSSN,roomNum,lengthOfStay) values 
   (5,5,Date'2023-01-20','01:00:08',3,1,2);

insert into Patient(SSN,fileNum,visit_date,visit_time,doctorSSN) values 
   (6,6,Date'2023-5-5','12:30:08',1);

select * from Patient;

insert into Appointment(Code,Adate,Atime,patientSSN,doctorSSN) values 
   (101,Date'2020-01-10','10:30:08',2,3);

insert into Appointment(Code,Adate,Atime,patientSSN,doctorSSN) values 
   (102,Date'2023-01-10','01:00:08',3,1);

insert into Appointment(Code,Adate,Atime,patientSSN,doctorSSN) values 
   (103,Date'2023-5-5','12:30:08',1,3);

select * from Appointment;

SELECT doctorSSN,COUNT(SSN) As "Number of patients"   
FROM Patient    
GROUP BY doctorSSN Having doctorSSN > 1;

select First_name, Last_name, Email, deptNum  
from   Person  
inner  join Doctor  
on     Person.SSN = Doctor.SSN;

