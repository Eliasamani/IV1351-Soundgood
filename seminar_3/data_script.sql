TRUNCATE TABLE 
  student_relations, 
  sibling_relations, 
  rental_record, 
  lesson_attendees, 
  lesson, 
  instructor_instruments, 
  instructor, 
  contact_person, 
  student, 
  rental_instruments, 
  price_scheme, 
  person, 
  instruments, 
  group_lesson, 
  ensemble, 
  classroom 
RESTART IDENTITY CASCADE;


-- Insert 25 unique persons
INSERT INTO person (first_name, last_name, personal_number, phone_number, email_address, street, city, zip)
VALUES
  -- 10 students
  ('John', 'Doe', '9901011234', '5551234567', 'john.doe@example.com', '1 Main St', 'Metropolis', '12345'),
  ('Jane', 'Smith', '8802022345', '5552345678', 'jane.smith@example.com', '2 Oak St', 'Gotham', '23456'),
  ('Jim', 'Beam', '7703033456', '5553456789', 'jim.beam@example.com', '3 Maple St', 'Star City', '34567'),
  ('Jill', 'Stark', '6604044567', '5554567890', 'jill.stark@example.com', '4 Pine St', 'Central City', '45678'),
  ('Jack', 'Sparrow', '5505055678', '5555678901', 'jack.sparrow@example.com', '5 Elm St', 'Coast City', '56789'),
  ('Alice', 'Wonder', '9412066789', '5556789012', 'alice.wonder@example.com', '6 Cedar St', 'Emerald City', '67890'),
  ('Bob', 'Builder', '8511077890', '5557890123', 'bob.builder@example.com', '7 Spruce St', 'Atlantis', '78901'),
  ('Charlie', 'Brown', '7612088901', '5558901234', 'charlie.brown@example.com', '8 Birch St', 'Springfield', '89012'),
  ('Diana', 'Prince', '6712099012', '5559012345', 'diana.prince@example.com', '9 Palm St', 'Themyscira', '90123'),
  ('Edward', 'Scissorhands', '5812100123', '5550123456', 'edward.scissorhands@example.com', '10 Cedar St', 'Suburbia', '01234'),
  -- 10 contact persons
  ('Frank', 'Ocean', '4912111234', '5551123456', 'frank.ocean@example.com', '11 Pine St', 'Oceania', '11234'),
  ('Grace', 'Atlas', '4012122345', '5552123456', 'grace.atlas@example.com', '12 Maple St', 'Atlantis', '21234'),
  ('Henry', 'Ford', '4112133456', '5553123456', 'henry.ford@example.com', '13 Oak St', 'Motorcity', '31234'),
  ('Ivy', 'Poison', '4212144567', '5554123456', 'ivy.poison@example.com', '14 Elm St', 'Gotham', '41234'),
  ('Jesse', 'Quick', '4312155678', '5555123456', 'jesse.quick@example.com', '15 Birch St', 'Central City', '51234'),
  ('Karen', 'Page', '4412166789', '5556123456', 'karen.page@example.com', '16 Palm St', 'Hells Kitchen', '61234'),
  ('Luke', 'Cage', '4512177890', '5557123456', 'luke.cage@example.com', '17 Cedar St', 'Harlem', '71234'),
  ('Mary', 'Poppins', '4612188901', '5558123456', 'mary.poppins@example.com', '18 Spruce St', 'London', '81234'),
  ('Nancy', 'Drew', '4712199012', '5559123456', 'nancy.drew@example.com', '19 Pine St', 'River Heights', '91234'),
  ('Oliver', 'Queen', '4812200123', '5550223456', 'oliver.queen@example.com', '20 Maple St', 'Star City', '02234'),
  -- 5 instructors
  ('Peter', 'Parker', '4912211234', '5551323456', 'peter.parker@example.com', '21 Oak St', 'New York', '13234'),
  ('Quinn', 'Harley', '5012222345', '5552323456', 'quinn.harley@example.com', '22 Elm St', 'Gotham', '23234'),
  ('Rachel', 'Dawes', '5112233456', '5553323456', 'rachel.dawes@example.com', '23 Pine St', 'Gotham', '33234'),
  ('Steve', 'Rogers', '5212244567', '5554323456', 'steve.rogers@example.com', '24 Birch St', 'Brooklyn', '43234'),
  ('Tony', 'Stark', '5312255678', '5555323456', 'tony.stark@example.com', '25 Palm St', 'Malibu', '53234');

-- Insert 10 students (person IDs 1-10)
INSERT INTO student (person_id)
SELECT id FROM person WHERE id BETWEEN 1 AND 10;

-- Insert 10 contact persons with specified relations
INSERT INTO contact_person (relation, person_id)
VALUES
  ('Parent', 11),
  ('Guardian', 12),
  ('Sibling', 13),
  ('Spouse', 14),
  ('Friend', 15),
  ('Relative', 16),
  ('Mentor', 17),
  ('Coach', 18),
  ('Cousin', 19),
  ('Grandparent', 20);

-- Insert 5 instructors (person IDs 21-25)
INSERT INTO instructor (teaches_ensembles, person_id)
VALUES
  (TRUE, 21),
  (FALSE, 22),
  (TRUE, 23),
  (TRUE, 24),
  (FALSE, 25);

-- Create student_relations between students and contact persons
INSERT INTO student_relations (student_id, contact_person_id)
VALUES
  (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
  (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Create 5 sibling relations (assuming student IDs)
INSERT INTO sibling_relations (student_id, sibling_student_id)
VALUES
  (1, 6), (2, 7), (3, 8), (4, 9), (5, 10);

-- Create 5 instruments
INSERT INTO instruments (instrument_type)
VALUES ('Guitar'), ('Piano'), ('Violin'), ('Drums'), ('Flute');

-- Insert random data into instructor_instruments
INSERT INTO instructor_instruments (instruments_id, instructor_id)
VALUES
  (5, 1), -- Instructor 1 knows Instrument 5
  (4, 1), -- Instructor 1 also knows Instrument 4
  (1, 2), -- Instructor 2 knows Instrument 1
  (5, 2), -- Instructor 2 also knows Instrument 5
  (2, 3), -- Instructor 3 knows Instrument 2
  (1, 3), -- Instructor 3 also knows Instrument 1
  (3, 4), -- Instructor 4 knows Instrument 3
  (2, 4), -- Instructor 4 also knows Instrument 2
  (4, 5), -- Instructor 5 knows Instrument 4
  (3, 5); -- Instructor 5 also knows Instrument 3

-- Create 5 rental instruments with price
INSERT INTO rental_instruments (rental_price, quantity_in_stock, brand, instruments_id)
VALUES
  (25, 5, 'Yamaha', 1),
  (30, 6, 'Steinway & Sons', 2),
  (35, 4, 'Gibson', 3),
  (40, 7, 'Fender', 4),
  (45, 3, 'Ibanez', 5);

-- Create 5 rental records (assuming rental_instrument IDs and student IDs)
INSERT INTO rental_record (rental_period, student_id, rental_instruments_id)
VALUES
  ('2023-09-01', 1, 1),
  ('2023-09-08', 2, 2),
  ('2023-09-15', 3, 3),
  ('2023-09-22', 4, 4),
  ('2023-09-29', 5, 5);

-- Create 5 classrooms
INSERT INTO classroom (person_capacity, street, city, zip)
VALUES
  (2, '101 Acoustic Ave', 'Noteville', '12345'),
  (25, '202 Bass Blvd', 'Treble Town', '23456'),
  (7, '303 Cello Ct', 'Harmony Hills', '34567'),
  (15, '404 Drum Dr', 'Rhythm City', '45678'),
  (3, '505 Electric Ave', 'Melody Meadows', '56789');

    -- Create 9 price schemes with all possible variations of skill_level and lesson_type, sorted
INSERT INTO price_scheme (price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_type)
VALUES
  -- Individual lessons
  (100, 0.10, TRUE, 20, 'individual', 'beginner'),
  (250, 0.25, FALSE, 35, 'individual', 'intermediate'),
  (310, 0.32, FALSE, 42, 'individual', 'advanced'),

  -- Group lessons
  (110, 0.12, FALSE, 22, 'group', 'beginner'),
  (150, 0.15, FALSE, 25, 'group', 'intermediate'),
  (300, 0.30, TRUE, 40, 'group', 'advanced'),

  -- Ensemble lessons
  (210, 0.22, FALSE, 32, 'ensemble', 'beginner'),
  (200, 0.20, TRUE, 30, 'ensemble', 'intermediate'),
  (260, 0.28, TRUE, 37, 'ensemble', 'advanced');

-- Insert 15 lessons, 5 of each type, with corresponding price_scheme_id
INSERT INTO lesson (date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type)
VALUES
  -- 5 Individual lessons, using the first 3 price_scheme_id for beginner, intermediate, advanced
  ('2023-03-01', '10:00', '1 hour', 1, 1, 1, 1, 'individual'),
  ('2023-06-02', '11:00', '1 hour 30 mins', 2, 2, 1, 2, 'individual'),
  ('2023-08-03', '12:00', '2 hours', 3, 3, 1, 3, 'individual'),
  ('2023-10-04', '13:00', '1 hour', 4, 1, 1, 4, 'individual'),
  ('2023-12-05', '14:00', '1 hour 30 mins', 5, 2, 1, 5, 'individual'),
  
  -- 5 Group lessons, using the next 3 price_scheme_id for beginner, intermediate, advanced
  ('2023-03-06', '15:00', '1 hour', 1, 4, 1, 1, 'group'),
  ('2023-07-07', '16:00', '1 hour 30 mins', 2, 5, 1, 2, 'group'),
  ('2023-09-08', '17:00', '2 hours', 3, 6, 1, 3, 'group'),
  ('2023-10-09', '18:00', '1 hour', 4, 4, 1, 4, 'group'),
  ('2023-12-10', '19:00', '1 hour 30 mins', 5, 5, 1, 5, 'group'),
  
  -- 5 Ensemble lessons, using the last 3 price_scheme_id for beginner, intermediate, advanced
  ('2023-02-11', '20:00', '1 hour', 1, 7, 1, 1, 'ensemble'),
  ('2023-06-12', '21:00', '1 hour 30 mins', 2, 8, 1, 2, 'ensemble'),
  ('2023-07-13', '22:00', '2 hours', 3, 9, 1, 3, 'ensemble'),
  ('2023-10-14', '23:00', '1 hour', 4, 7, 1, 4, 'ensemble'),
  ('2023-11-15', '24:00', '1 hour 30 mins', 5, 8, 1, 5, 'ensemble');

  -- Insert corresponding group_lesson entries with random min and max attendees
INSERT INTO group_lesson (lesson_id, min_attendees, max_attendees, attendees)
VALUES
  (6, 3, 12, 5),   -- Random values between 3 and 25 for min and max attendees
  (7, 4, 15, 7),
  (8, 5, 20, 10),
  (9, 6, 18, 8),
  (10, 7, 25, 7);

  -- Insert corresponding ensemble entries with random min and max attendees
INSERT INTO ensemble (lesson_id, min_attendees, max_attendees, attendees, genre)
VALUES
  (11, 5, 25, 8, 'Jazz'),   -- Random values between 3 and 25 for min and max attendees
  (12, 6, 22, 7, 'Rock'),
  (13, 4, 18, 5, 'Classical'),
  (14, 5, 20, 6, 'Blues'),
  (15, 4, 15, 4, 'Pop');

-- Insert lesson attendees for group lessons and ensembles
INSERT INTO lesson_attendees (student_id, lesson_id)
VALUES
  -- Attendees for individual lessons
  (1, 1),  -- Student 1 attending the first individual lesson
  (2, 2),  -- Student 2 attending the second individual lesson
  (3, 3),  -- and so on
  (4, 4),
  (5, 5),

  -- Attendees for the first group lesson (lesson_id = 6)
  (1, 6), (2, 6), (3, 6), (4, 6), (5, 6),
  -- Attendees for the second group lesson (lesson_id = 7)
  (6, 7), (7, 7), (8, 7), (9, 7), (10, 7), (1, 7),
  -- Attendees for the third group lesson (lesson_id = 8)
  (2, 8), (3, 8), (4, 8), (5, 8), (6, 8), (7, 8), (8, 8), (9, 8), (10, 8), (1, 8),
  -- Attendees for the fourth group lesson (lesson_id = 9)
  (2, 9), (3, 9), (4, 9), (5, 9), (6, 9), (7, 9), (8, 9),
  -- Attendees for the fifth group lesson (lesson_id = 10)
  (9, 10), (10, 10), (1, 10), (2, 10), (3, 10), (4, 10), (5, 10), (6, 10),

  -- Attendees for the first ensemble lesson (lesson_id = 11)
  (7, 11), (8, 11), (9, 11), (10, 11), (1, 11), (2, 11), (3, 11), (4, 11),
  -- Attendees for the second ensemble lesson (lesson_id = 12)
  (5, 12), (6, 12), (7, 12), (8, 12), (9, 12), (10, 12), (1, 12),
  -- Attendees for the third ensemble lesson (lesson_id = 13)
  (2, 13), (3, 13), (4, 13), (5, 13),
  -- Attendees for the fourth ensemble lesson (lesson_id = 14)
  (6, 14), (7, 14), (8, 14), (9, 14), (10, 14), (1, 14),
  -- Attendees for the fifth ensemble lesson (lesson_id = 15)
  (2, 15), (3, 15), (4, 15), (5, 15);