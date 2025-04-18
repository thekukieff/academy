/*Select [name] + ' ' + surname AS 'Full name'
FROM doctors*/
use Academy


Create table Curators(
	id int identity(1,1) primary key not null,
	[name] nvarchar(max) not null,
	surname nvarchar(max) not null,
	
	constraint  Curator_surname_not_empty check (Curators.surname not like '/\n\n/g'),
	constraint Curator_name_not_emty check (Curators.[name] not like '/\n\n/g')
) 

CREATE TABLE Departments(
	id int identity(1,1) PRIMARY KEY not null,
	[name] nvarchar(100) unique not null,
	financing money not null default(0),
	facultyId int not null,

	constraint aDepartments_financing_not_less_then_0 check (Departments.financing >= 0),
	constraint aDepatment_name_not_empty check (Departments.[name] not like '/\n\n/g'),
	)

CREATE TABLE Faculties(
	id int identity(1,1) PRIMARY KEY not null,
	financing money not null default(0),
	[name] nvarchar(100) unique not null,

	constraint Faculties_financing_not_less_then_0 check (Faculties.financing >= 0),
	constraint  Faculties_name_not_empty check (Faculties.[name] not like '/\n\n/g')

)

CREATE TABLE Groups(
	id int identity(1,1) PRIMARY KEY not null,
	[name] nvarchar(10) unique not null,
	[year] int not null,
	departmentId int not null,


	constraint Groups_year_in_diapozon_1_to_5 check(Groups.[year] <= 5 and Groups.[year] >= 1),
	FOREIGN KEY(departmentId) REFERENCES Departments(id),
);

CREATE TABLE GroupsCurators(
	id int identity(1,1) PRIMARY KEY not null,


	

);

CREATE TABLE GroupLectors(
	id int identity(1,1) PRIMARY KEY not null,
	groupId int not null,
	lectureId int not null,

);

CREATE TABLE Lectors(
	id int identity(1,1) PRIMARY KEY not null,
	lectureRoom nvarchar(max) not null,
	subjectId int not null,
	teacherId int not null,

	constraint  Lectors_lectureRoom_not_empty check (Lectors.lectureRoom not like '/\n\n/g')
);

CREATE TABLE Subjects(
	id int identity(1,1) PRIMARY KEY not null,
	[name] nvarchar(100) unique not null,


);

CREATE TABLE Teachers(
	id int identity(1,1) PRIMARY KEY not null,
	[name] nvarchar(max) not null,
	salary money not null,
	surname nvarchar(max) not null,

	constraint  Teachers_name_not_empty check (Teachers.[name] not like '/\n\n/g'),
	constraint Teachers_salary_not_less_then_0 check (Teachers.salary >= 0),
	constraint  Teachers_surname_not_empty check (Teachers.surname not like '/\n\n/g'),

);




go

INSERT INTO Curators ([name], surname)
values
('outworld' , 'destroyer'),
('templar', 'assasin');

Insert into Departments([name], financing, facultyId)
values
('History', 1, 1);


Insert into Faculties(financing, [name])
values
(10000000,'IT'),
(10000, 'math'),
(1, 'english');

Insert into Groups([name], [year], departmentId)
values
('C-o-C-a-1', 15,1),
('e4-e5',89,2);

select *from Faculties
--урок номер 2 alter table, 5 таблица

