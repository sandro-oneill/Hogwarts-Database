--create database
if not exists (select * from sys.databases where name = 'hogwarts')
create database hogwarts
GO
use hogwarts
GO
--
GO
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_houses_founder_id')
   alter table houses drop constraint fk_houses_founder_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_houses_faculty_id')
   alter table houses drop constraint fk_houses_faculty_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_houses_ghost_id')
   alter table houses drop constraint fk_houses_ghost_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_students_house_id')
   alter table students drop constraint fk_students_house_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_students_wand_id')
   alter table students drop constraint fk_students_wand_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_classes_faculty_id')
   alter table classes drop constraint fk_classes_faculty_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_student_classes_student_id')
   alter table student_classes drop constraint fk_student_classes_student_id
 
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_student_classes_class_id')
   alter table student_classes drop constraint fk_student_classes_class_id

if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='u_wood_type')
   alter table woods drop constraint u_wood_type
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='u_subtance_type')
   alter table substance drop constraint u_subtance_type
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='u_species_name')
   alter table species drop constraint u_species_name
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_team_players_player_id')
   alter table team_players drop constraint fk_team_players_player_id
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_team_players_team_id')
   alter table team_players drop constraint fk_team_players_team_id


if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   where CONSTRAINT_NAME ='fk_wand_woods_wand_id')
   alter table wand_woods drop constraint fk_wand_woods_wand_id
if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_wand_woods_wood_id')
alter table wand_woods drop constraint fk_wand_woods_wood_id

if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_wand_substances_wand_id')
alter table wand_substances drop constraint fk_wand_substances_wand_id
if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_wand_substances_substance_id')
alter table wand_substances drop constraint fk_wand_substances_substance_id

if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_pet_species_pet_id')
alter table pets_species drop constraint fk_pet_species_pet_id
if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_pet_species_species_id')
alter table pets_species drop constraint fk_pet_species_species_id

if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_student_pets_student_id')
alter table student_pets drop constraint fk_student_pets_student_id
if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_student_pets_pet_id')
alter table student_pets drop constraint fk_student_pets_pet_id

if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_grades_student_id')
alter table grades drop constraint fk_grades_student_id

if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME ='fk_quidditch_teams_team_house_id')
alter table quidditch_teams drop constraint fk_quidditch_teams_team_house_id
if exists (select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_NAME = 'fk_qudditch_teams_quidditch_cap_student_id')
alter table quidditch_teams drop constraint fk_qudditch_teams_quidditch_cap_student_id
 
 
 
 
 
 
 
 
GO
drop table if exists houses
drop table if exists students
drop table if exists faculty
drop table if exists wands
drop table if exists classes
drop table if exists founders
drop table if exists players
drop table if exists student_classes
drop table if exists woods
drop table if exists substances
drop table if exists species
drop table if exists pets
drop table if exists team_players
drop table if exists ghosts
drop table if exists quidditch_teams
drop table if exists grades
drop table if exists student_pets
drop table if exists pets_species
drop table if exists wand_substances
drop table if exists wand_woods
 
GO
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
-- pets table
create table pets (
   pet_id INT IDENTITY NOT NULL,
   pet_name varchar(50) NOT NULL,
   CONSTRAINT pk_pets_id PRIMARY KEY (pet_id)
)
 
-- species table
create table species (
   species_id INT IDENTITY NOT NULL,
   species_name varchar(50) NOT NULL,
   CONSTRAINT pk_species_id PRIMARY KEY (species_id),
   CONSTRAINT u_species_name unique(species_name)
)
 
-- substances table
create table substances (
   substance_id INT IDENTITY NOT NULL,
   substance_name varchar(50) NOT NULL,
   CONSTRAINT pk_substances_id PRIMARY KEY (substance_id),
   CONSTRAINT u_substance_name unique(substance_name)
)
-- woods table
create table woods(
   wood_id INT IDENTITY NOT NULL,
   wood_type varchar(50) NOT NULL,
   CONSTRAINT pk_woods_id PRIMARY KEY (wood_id),
   CONSTRAINT u_wood_type unique(wood_type)
)
 
--wands
CREATE TABLE wands
(
   wand_id INT NOT NULL,
   wand_length VARCHAR(5) NOT NULL,
   CONSTRAINT pk_wands_wand_id PRIMARY KEY(wand_id)
)
 
--players
CREATE TABLE players
(
  player_id INT NOT NULL,
  player_name VARCHAR(50),
  player_position VARCHAR(30),
  player_house_id INT NOT NULL,
  CONSTRAINT pk_players_player_id PRIMARY KEY(player_id)
)

 
 
 
 
--founders
CREATE TABLE founders
(
   founder_id INT NOT NULL,
   founder_name VARCHAR(40),
   CONSTRAINT pk_founders_founder_id PRIMARY KEY(founder_id),
   CONSTRAINT u_founders_founder_name UNIQUE(founder_name)
)
 
 
 
 
--faculty
CREATE TABLE faculty
(
   faculty_id INT NOT NULL,
   faculty_lastname VARCHAR(50) NOT NULL,
   faculty_firstname VARCHAR(50) NOT NULL,
   faculty_position VARCHAR(100) NOT NULL,
   CONSTRAINT pk_faculty_faculty_id PRIMARY KEY(faculty_id)
)
 
-- ghosts table
create table ghosts (
   ghost_id INT IDENTITY NOT NULL,
   ghost_name varchar(50) NOT NULL,
   CONSTRAINT pk_ghosts_id PRIMARY KEY (ghost_id)
)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
--Quidditch Teams
create table quidditch_teams(
team_id int not null,
team_house_id int not null,
qudditch_cap_student_id int not null,
constraint pk_qudditch_teams_team_id primary key(team_id)
)





--Grades
create table grades(
grade_id int identity not null,
owl_score int null,
gpa int null,
grade_student_id int not null,
constraint pk_grades_grade_id primary key(grade_id)
)





--Student Pets
create table student_pets(
student_id int not null,
pet_id int not null,
constraint pk_student_pets primary key(student_id,pet_id)
)


--Pet Species 
create table pets_species(
pet_id int not null,
species_id int not null,
constraint pk_pets_species primary key(pet_id,species_id)
)




--Wand Substances
create table wand_substances(
wand_id int not null,
substance_id int not null,
constraint pk_wand_substances primary key(wand_id,substance_id)
)



--Wand Woods
create table wand_woods(
wand_id int not null,
wood_id int not null,
constraint pk_wand_woods primary key(wand_id,wood_id)
)



 
 
--houses
CREATE TABLE houses
(
  house_id INT NOT NULL,
  house_name VARCHAR(50) NOT NULL,
  faculty_id INT NOT NULL,
  ghost_id INT NOT NULL,
  founder_id INT NOT NULL,
  CONSTRAINT pk_houses_id PRIMARY KEY (house_id),
  CONSTRAINT u_houses_house_name UNIQUE(house_name)
)
 
 
--students
CREATE TABLE students
(
   student_id INT NOT NULL,
   student_lastname VARCHAR(70) NOT NULL,
   student_firstname VARCHAR(70) NOT NULL,
   student_year INT NOT NULL,
   student_address VARCHAR(250) NULL,
   house_id INT NOT NULL,
   wand_id INT NULL,
   CONSTRAINT pk_students_student_id PRIMARY KEY(student_id)
)
 
 
 
 
 
 
 
 
 
 
--classes
CREATE TABLE classes
(
   class_id INT NOT NULL,
   class_name VARCHAR(70),
   faculty_id INT NOT NULL,
   CONSTRAINT pk_classes_class_id PRIMARY KEY(class_id)
)
 
 
 
 
 
--student_class bridge table
CREATE TABLE student_classes
(
   student_id INT NOT NULL,
   class_id INT NOT NULL,
   CONSTRAINT pk_student_classes_student_id PRIMARY KEY(student_id, class_id)
)
 
 
 
 
-- team_players bridge table
create table team_players (
   team_id INT NOT NULL,
   player_id INT NOT NULL,
   constraint pk_team_players PRIMARY KEY (team_id,player_id)
   
)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
--foreign keys
 
ALTER TABLE student_classes
   ADD CONSTRAINT fk_student_classes_student_id FOREIGN KEY(student_id)
       REFERENCES students(student_id)
  
ALTER TABLE student_classes
   ADD CONSTRAINT fk_student_classes_class_id FOREIGN KEY(class_id)
       REFERENCES classes(class_id)
 
 
ALTER TABLE classes
   ADD CONSTRAINT fk_classes_faculty_id FOREIGN KEY(faculty_id)
       REFERENCES faculty(faculty_id)
 
ALTER TABLE students
   ADD CONSTRAINT fk_students_house_id FOREIGN KEY(house_id)
       REFERENCES houses(house_id)
 
ALTER TABLE students
   ADD CONSTRAINT fk_students_wand_id FOREIGN KEY(wand_id)
       REFERENCES wands(wand_id)
 
 
ALTER TABLE houses
   ADD CONSTRAINT fk_houses_faculty_id FOREIGN KEY(faculty_id)
       REFERENCES faculty(faculty_id)
 
ALTER TABLE houses
   ADD CONSTRAINT fk_houses_ghost_id FOREIGN KEY(ghost_id)
       REFERENCES ghosts(ghost_id)
 
 
 
ALTER TABLE houses
   ADD CONSTRAINT fk_houses_founder_id FOREIGN KEY(founder_id)
       REFERENCES founders(founder_id)
 
 

alter table wand_woods
   add constraint fk_wand_woods_wand_id foreign key (wand_id)
       references wands(wand_id)
alter table wand_woods
   add constraint fk_wand_woods_wood_id foreign key (wood_id)
       references woods(wood_id)


alter table wand_substances
 add constraint fk_wand_substances_wand_id foreign key (wand_id)
    references wands(wand_id)
alter table wand_substances
   add constraint fk_wand_substances_substance_id foreign key (substance_id)
       references substances(substance_id)

alter table pets_species
   add constraint fk_pet_species_pet_id foreign key (pet_id)
       references pets(pet_id)
alter table pets_species
   add constraint fk_pet_species_species_id foreign key (species_id)
       references species(species_id)


alter table student_pets
   add constraint fk_student_pets_student_id foreign key (student_id)
       references students(student_id)
alter table student_pets
   add constraint fk_student_pets_pet_id foreign key (pet_id)
       references pets(pet_id)



alter table grades
   add constraint fk_grades_student_id foreign key (grade_student_id)
       references students(student_id)


alter table quidditch_teams
   add constraint fk_quidditch_teams_team_house_id foreign key(team_house_id)
       references houses(house_id)
alter table quidditch_teams
   add constraint fk_qudditch_teams_quidditch_cap_student_id foreign key (qudditch_cap_student_id)
       references students(student_id)
alter table team_players
   add constraint fk_team_players_team_id FOREIGN KEY (team_id)
       REFERENCES quidditch_teams(team_id)
alter table team_players
   add constraint fk_team_players_player_id FOREIGN KEY (player_id)
   REFERENCES players(player_id)
GO

-- UP METADATA
-- ghosts table data
INSERT INTO ghosts VALUES ('Nearly Headless Nick'),
('The Gray Lady'),
('The Fat Friar'),
('The Bloody Baron'),
('Peeves the Poltergeist'),
('Moaning Myrtle')
-- species data
INSERT INTO species VALUES ('Owl'),
('Cat'),
('Ferret'),
('Rat')
-- substances data
INSERT INTO substances VALUES 
('Dragon Heartstring'),
('Phoenix Feathers'),
('Unicorn Hair'),
('Veela Hair'),
('Thestral Tail Hair'),
('Troll Whisker'),
('Kelpie Hair'),
('Thunderbird Tail Feather'),
('Wampus Cat Hair'),
('White River Monster Spine'),
('Rougarou Hair'),
('Kneazle Whisker'),
('Horned Serpent Horn'),
('Snally gaster Heartstring'),
('Jackalope Antler'),
('Basilisk Horn')
-- woods data
INSERT INTO woods VALUES 
('Elm'),
('Ash'),
('Hazel'),
('Red Oak'),
('English Oak'),
('Sugar Maple'),
('Pine'),
('Snakewood'),
('Chestnut'),
('Reed')
-- wands table data
INSERT INTO wands VALUES 
(1,11),
(2,10.75),
(3,12),
(4,9.5),
(5,10.25),
(6,10.25),
(7,10),
(8,11.25),
(9,12.25),
(10,9)
-- wand_woods bridge table data
INSERT INTO wand_woods VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10)
-- wand_substances bridge table data
INSERT INTO wand_substances VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10)
--faculty data
INSERT INTO faculty VALUES
(1, 'Dumbledore', 'Albus', 'Headmaster'),
(2, 'Snape', 'Severus', 'Professor'),
(3, 'McGonagall', 'Minerva', 'Headmistress'),
(4, 'Hagrid', 'Rubeus', 'Caretaker'),
(5, 'Umbridge', 'Dolores', 'Professor'),
(6, 'Lupin', 'Remus', 'Professor'),
(7, 'Filch', 'Argus', 'Caretaker'),
(8, 'Sprout', 'Pomona', 'Professor'),
(9, 'Lockhart', 'Gilderoy', 'Professor'),
(10, 'Flitwick', 'Filius', 'Professor'),
(11, 'Slughorn', 'Horace', 'Professor'),
(12, 'Hooch', 'Rolanda', 'Flying Coach'),
(13, 'Qirrell','Quirinus', 'Professor'),
(14, 'Binns', 'Cuthbert', 'Professor'),
(15, 'Trelawney', 'Sybill', 'Professor'),
(16, 'Grubbly', 'Wilhelmina', 'Caretaker'),
(17, 'Moody', 'Alastor', 'Professor')

--founders data
INSERT INTO founders VALUES
(1, 'Godric Gryffindor'),
(2, 'Helga Hufflepuff'),
(3, 'Rowena Ravenclaw'),
(4, 'Salazar Slytherin')
--houses data
INSERT INTO houses VALUES
(1, 'Gryffindor', 3, 1, 1),
(2, 'Hufflepuff', 8, 3, 2),
(3, 'Ravenclaw', 10, 2,3),
(4,'Slytherin', 2, 4, 4)

INSERT INTO students
VALUES
(1, 'Potter', 'Harry', 5, '4 Privet Dive, Little Whinging, Surrey', 1, 1),
(2, 'Granger', 'Hermione', 5, NULL, 1, 2),
(3, 'Weasley', 'Ronald', 5, 'The Oddery Ottery St. Catchpole', 1, 3),
(4, 'Weasley', 'Ginerva', 4,'The Oddery Ottery St. Catchpole' , 1, 4),
(5, 'Weasley', 'Fred', 6, 'The Oddery Ottery St. Catchpole', 1, 5),
(6, 'Weasley', 'George', 5, 'The Oddery Ottery St. Catchpole', 1, 6),
(7, 'Malfoy', 'Draco', 5, 'Malfoy Manor Wiltshire, England', 4, 7),
(8, 'Lovegood', 'Luna', 5, NULL, 3, 8),
(9, 'Longbottom', 'Neville', 5, NULL, 1, 9),
(10,'Patil', 'Padma', 4, NULL, 3, 10),
(11, 'Patil', 'Parvati', 4, NULL, 1, NULL),
(12, 'Chang', 'Cho', 6, NULL, 3, NULL),
(13, 'Diggory', 'Cedric', 6, NULL, 2, NULL),
(14, 'Crabbe', 'Vincent', 5, NULL, 4, NULL),
(15, 'Goyle', 'Gregory', 5, NULL, 4, NULL),
(16, 'Zabini', 'Blaise', 4, NULL, 4, NULL),
(17, 'Thomas', 'Dean', 5, NULL, 1, NULL),
(18, 'Finnigan', 'Seamus', 5, NULL, 1, NULL),
(19, 'Brown', 'Lavender', 4, NULL, 1, NULL),
(20, 'Applebee', 'Tasmin', 3, NULL, 2, NULL),
(21, 'Fletchley', 'Justin', 3, NULL, 2, NULL),
(22, 'Abbott', 'Hannah', 3, NULL, 2, NULL),
(23, 'Bones', 'Susan', 2, NULL, 2, NULL),
(24, 'Boot', 'Terry', 2, NULL, 3, NULL),
(25, 'Brocklehurst', 'Mandy', 2, NULL, 3, NULL),
(26, 'Davies', 'Roger', 1, NULL, 3, NULL),
(27, 'Stretton', 'Jeremy', 1, NULL, 3, NULL),
(28, 'Turpin', 'Lisa', 1, NULL, 3, NULL),
(29, 'Nott', 'Theodore', 1, NULL, 4, NULL),
(30, 'Parkinson', 'Pansy', 1, NULL, 4, NULL),
(31, 'Bulstrode', 'Millicent', 7, NULL, 4, NULL),
(32, 'Greengrass', 'Daphne', 7, NULL, 4, NULL),
(33, 'Hopkins', 'Wayne', 7, NULL, 2, NULL),
(34, 'Oflaherty', 'Maxine', 7, NULL, 2, NULL),
(35, 'Malone', 'Roger', 3, NULL, 2, NULL),
(36, 'Rickett', 'Anthony', 3, NULL, 2, NULL),
(37, 'Burrow', 'Randolph', 3, NULL, 3, NULL),
(38, 'Cornfoot', 'Stephen', 3, NULL, 3, NULL),
(39, 'Inglebee', 'Duncan', 2, NULL, 3, NULL),
(40, 'Li', 'Sue', 2, NULL, 1, NULL),
(41, 'Davis', 'Tracey', 2, NULL, 4, NULL),
(42, 'Moon', 'Lily', 2, NULL, 1, NULL),
(43, 'Roper', 'Sophie', 4, NULL, 1, NULL),
(44, 'Perks', 'Sally', 4, NULL, 2, NULL),
(45, 'Macavoy', 'Heidi', 5, NULL, 2, NULL),
(46, 'Smith', 'Sally', 6, NULL, 4, NULL),
(47, 'Preece', 'Malcom', 6, NULL, 2, NULL),
(48, 'Fleet', 'Herbery', 5, NULL, 2, NULL),
(49, 'Samuels', 'Jason', 4, NULL, 3, NULL),
(50, 'Page', 'Grant', 4, NULL, 3, NULL),
(51, 'Rivers', 'Oliver', 3, NULL, 4, NULL),
(52, 'Pucey', 'Jack', 6, NULL, 4, NULL),
(53, 'Derrick', 'Dylan', 6, NULL, 4, NULL)
 
 

--classes data
INSERT INTO classes VALUES
(1, 'Defense Against the Dark Arts', 2),
(2, 'Potions', 11),
(3, 'Astronomy', 9),
(4, 'Herbology', 8),
(5, 'Dark Arts', 17),
(6, 'Transfiguration', 3),
(7, 'Music', 10),
(8, 'Divination', 15),
(9, 'Care of Magical Creatures', 4),
(10,'Charms and Spells', 5),
(11, 'History of Magic', 6),
(12, 'Flying', 12),
(13, 'Muggle Studies', 14)

INSERT INTO student_classes VALUES
(1, 1),
(2, 3),
(9, 4),
(10, 7),
(2, 1),
(3, 1),
(4, 1),
(10, 1),
(11, 1),
(33, 1),
(1, 8),
(2, 8),
(3, 8),
(1, 4),
(2, 4),
(35, 13),
(22, 1),
(25, 9),
(1, 9),
(2, 9),
(3, 9),
(11, 10),
(42, 10),
(2, 6),
(3, 6),
(28, 6),
(17, 6),
(41, 2),
(43, 2),
(34, 2),
(21, 2),
(3, 3),
(1, 3),
(4, 3),
(15, 4),
(16, 4),
(17, 4),
(22, 5),
(23, 5),
(24, 5),
(25, 5),
(11, 7),
(37, 7),
(52, 7),
(27, 10),
(8, 11),
(9, 11),
(31, 11),
(50, 11),
(44, 12),
(50, 12),
(47, 12),
(46, 12),
(43, 13),
(25, 13),
(5, 13),
(24,13)
 
--players

INSERT INTO players VALUES
(1, 'Harry Potter', 'Seeker', 1),
(2, 'Fred Weasley', 'Beater', 1),
(3, 'George Weasley', 'Beater', 1),
(4, 'Ronald Weasley', 'Keeper', 1),
(5, 'Ginerva Weasley', 'Chaser', 1),
(6, 'Dean Thomas', 'Chaser', 1),
(7, 'Seamus Finnigan', 'Chaser', 1),
(8, 'Cedric Diggory', 'Seeker', 2),
(9, 'Maxine Oflaherty', 'Beater', 2),
(10,'Anthony Rickett', 'Beater', 2),
(11, 'Herbery Fleet', 'Keeper', 2),
(12, 'Malcolm Preece', 'Chaser', 2),
(13, 'Heidi Macavoy', 'Chaser', 2),
(14, 'Tasmin Applebee', 'Chaser', 2),
(15, 'Cho Chang', 'Seeker', 3),
(16, 'Duncan Inglebee', 'Beater', 3),
(17, 'Jason Samuels', 'Beater', 3),
(18, 'Grant Page', 'Keeper', 3),
(19, 'Roger Davies', 'Chaser', 3),
(20, 'Jeremy Stretton', 'Chaser', 3),
(21, 'Randolph Burrow', 'Chaser', 3),
(22, 'Draco Malfoy', 'Seeker', 4),
(23, 'Oliver Rivers', 'Beater', 4),
(24, 'Blaise Zabini', 'Beater', 4),
(25, 'Dylan Derrick', 'Keeper', 4),
(26, 'Jack Pucey', 'Chaser', 4),
(27, 'Gregory Goyle', 'Chaser', 4),
(28, 'Vincent Crabbe', 'Chaser', 4)
 
--student classes

--quidditch_teams data
INSERT INTO quidditch_teams values
(1,1,1),
(2,2,13),
(3,3,49),
(4,4,52)

-- team_players data
INSERT INTO team_players VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(2,8),
(2,9),
(2,10),
(2,11),
(2,12),
(2,13),
(2,14),
(3,15),
(3,16),
(3,17),
(3,18),
(3,19),
(3,20),
(3,21),
(4,22),
(4,23),
(4,24),
(4,25),
(4,26),
(4,27),
(4,28)

-- grades
insert into grades 
  values

(4,3.68,1),
(4,3.88,2),
(3,2.12,3),
(2,3.55,4),
(5,1.33,5),
(6,2.81,6),
(6,2.04,7),
(7,3.57,8),
(7,1.31,9),
(5,3.83,10),
(5,3.06,11),
(1,1.78,12),
(2,2.74,13),
(5,3.1,14),
(2,3.26,15),
(7,1.53,16),
(3,3.4,17),
(2,3.56,18),
(4,1.42,19),
(1,1.03,20),
(3,1.82,21),
(3,1.63,22),
(4,3.18,23),
(6,2.86,24),
(4,3.83,25),
(7,3.37,26),
(5,1.2,27),
(2,2.79,28),
(6,1.62,29),
(7,1.79,30),
(5,1.05,31),
(7,2.86,32),
(1,1.47,33),
(7,2.86,34),
(7,2.88,35),
(2,3.42,36),
(6,3.89,37),
(6,3.87,38),
(5,3.96,39),
(6,2.8,40),
(1,2.62,41),
(2,3,42),
(3,3.38,43),
(3,1.83,44),
(4,2.96,45),
(1,3.88,46),
(4,2.9,47),
(5,3.14,48),
(1,1.07,49),
(5,3.69,50),
(2,2.77,51),
(5,3.81,52)
-- pets data
INSERT INTO pets VALUES('Hedwig'),('Crookshanks'),('Scabbers')
-- student_pets data
INSERT INTO student_pets VALUES (1,1), (2,2), (3,3)
-- pets species data
INSERT INTO pets_species VALUES (1,1),(2,2),(3,4)




