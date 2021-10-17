-- External Data Model
use hogwarts
go
--As a faculty member, I should be able to see what classes a student is in so that they are on the right track to graduate.
select students.student_id,
    student_firstname + ' ' + student_lastname as student_name,
    student_year,
    classes.class_id,
    classes.class_name
from students
join student_classes on students.student_id=student_classes.student_id
join classes on student_classes.class_id=classes.class_id


--As a student, I should be able to see what teacher is teaching a class so that I can make my schedule appropriate to my liking.
select class_id,class_name,faculty.faculty_id,
faculty_firstname + ' ' + faculty_lastname as Professor_name 
from classes
join faculty on classes.faculty_id = faculty.faculty_id

--As a student, I should be able to see the components of my wand so that if it ever goes missing I can know how to replace it.
select student_firstname + ' ' + student_lastname as student_name,
wands.wand_id,wand_length,wood_type,substance_name from wands
join wand_woods on wands.wand_id = wand_woods.wand_id
join wand_substances on wands.wand_id = wand_substances.wand_id
join woods on wand_woods.wood_id = woods.wood_id
join substances on wand_substances.substance_id = substances.substance_id
join students on wands.wand_id = students.wand_id


--As a faculty member, I should be able to view student addresses in order to mail school correspondence so that students are prepared before the term starts. 
select student_id,student_firstname,student_lastname,student_year,student_address
 from students

--As a faculty member, I should be able to view the names and species of the pets each student has and will bring to the school so the number of pets are not exceeded.
select students.student_id, student_firstname + ' ' + student_lastname as student_name,
student_year, pet_name, species_name
from student_pets
join students on student_pets.student_id = students.student_id
join pets on student_pets.pet_id = pets.pet_id
join pets_species on pets.pet_id = pets_species.pet_id
join species on pets_species.species_id = species.species_id

--As a faculty member, I should be able to view the quidditch players so that I can assign the correct number of players to a team. 
select player_id,player_name,player_position,house_name,
dense_rank() over (partition by house_name order by player_name) team_member_count
from players
join houses on player_house_id = house_id
-- teams can be filtered usign WHERE statement