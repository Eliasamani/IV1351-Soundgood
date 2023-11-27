-- Insert sample data into address table
INSERT INTO address (street, zip, city) VALUES
('123 Maple Street', 12345, 'Springfield'),
('456 Oak Avenue', 23456, 'Shelbyville'),
('789 Birch Lane', 34567, 'Riverdale'),
('1010 Cedar Blvd', 45678, 'Hilldale');

-- Insert sample data into classroom table
INSERT INTO classroom (person_capacity, street, city, zip) VALUES
(30, '789 Pine Road', 'Springfield', 12345),
(20, '101 Elm Street', 'Shelbyville', 23456),
(25, '202 Willow Way', 'Riverdale', 34567),
(15, '303 Maple Drive', 'Hilldale', 45678);

-- Insert sample data into instruments table
INSERT INTO instruments (instrument_type) VALUES
('Piano'),
('Violin'),
('Guitar'),
('Drums');

-- Insert sample data into person table for students, instructors, and contact persons
INSERT INTO person (first_name, last_name, personal_number, phone_number, email_adress, street, city, zip) VALUES
('John', 'Doe', 1001, 1234567890, 'john.doe@email.com', '123 Maple Street', 'Springfield', 12345),
('Jane', 'Smith', 1002, 2345678901, 'jane.smith@email.com', '456 Oak Avenue', 'Shelbyville', 23456),
('Alice', 'Johnson', 1003, 3456789012, 'alice.johnson@email.com', '789 Birch Lane', 'Riverdale', 34567),
('Bob', 'Brown', 1004, 4567890123, 'bob.brown@email.com', '1010 Cedar Blvd', 'Hilldale', 45678),
-- Instructors
('Emily', 'White', 2001, 5678901234, 'emily.white@email.com', '202 Willow Way', 'Riverdale', 34567),
('David', 'Green', 2002, 6789012345, 'david.green@email.com', '303 Maple Drive', 'Hilldale', 45678),
-- Contact persons
('Rachel', 'Adams', 3001, 7890123456, 'rachel.adams@email.com', '303 Maple Drive', 'Hilldale', 45678),
('Chris', 'Thompson', 3002, 8901234567, 'chris.thompson@email.com', '101 Elm Street', 'Shelbyville', 23456);

-- Insert sample data into price_scheme table
INSERT INTO price_scheme (price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_type) VALUES
(50, 10, TRUE, 30, 'individual', 'beginner'),
(80, 5, FALSE, 50, 'group', 'intermediate'),
(100, 0, FALSE, 40, 'ensemble', 'advanced'),
(70, 15, TRUE, 35, 'group', 'beginner');

-- Insert sample data into rental_instruments table
INSERT INTO rental_instruments (quantity_in_stock, brand, instruments_id) VALUES
(5, 'Yamaha', 1),
(3, 'Stradivarius', 2),
(4, 'Fender', 3),
(2, 'Pearl', 4);

-- Insert sample data into student table
INSERT INTO student (person_id) VALUES
(1),
(2),
(3),
(4);

-- Insert sample data into contact_person table
INSERT INTO contact_person (relation, person_id) VALUES
('Father', 3001),
('Mother', 3002);

-- Insert sample data into instructor table
INSERT INTO instructor (teaches_ensembles, person_id) VALUES
(TRUE, 2001),
(FALSE, 2002);

-- Insert sample data into instructor_instruments table
INSERT INTO instructor_instruments (instruments_id, instructor_id) VALUES
(1, 2001),
(2, 2002),
(3, 2001),
(4, 2002);

-- Insert sample data into lesson table
INSERT INTO lesson (date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type) VALUES
('2023-09-01', 1400, 60, 1, 1, 2001, 1, 'individual'),
('2023-09-02', 1500, 90, 2, 2, 2002, 2, 'group'),
('2023-09-03', 1600, 120, 3, 3, 2001, 3, 'ensemble'),
('2023-09-04', 1700, 45, 4, 4, 2002, 4, 'group');

-- Insert sample data into lesson_attendees table
INSERT INTO lesson_attendees (student_id, lesson_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert sample data into rental_record table
INSERT INTO rental_record (rental_period, rental_price, student_id, rental_instruments_id) VALUES
('2023-09-01', 20, 1, 1),
('2023-09-02', 25, 2, 2),
('2023-09-03', 30, 3, 3),
('2023-09-04', 15, 4, 4);

-- Insert sample data into student_relations table
INSERT INTO student_relations (student_id, contact_person_id) VALUES
(1, 3001),
(2, 3002),
(3, 3001),
(4, 3002);

-- Insert sample data into group_lesson table (inherits lesson)
INSERT INTO group_lesson (min_attendees, max_attendees, attendees, date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type) VALUES
(5, 10, 8, '2023-09-05', 1800, 120, 1, 2, 2001, 1, 'group'),
(3, 6, 5, '2023-09-06', 1900, 90, 2, 4, 2002, 2, 'group');

-- Insert sample data into sibling_relations table
INSERT INTO sibling_relations (student_id, sibling_student_id) VALUES
(1, 2),
(3, 4);

-- Insert sample data into ensemble table (inherits group_lesson)
INSERT INTO ensemble (genre, min_attendees, max_attendees, attendees, date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type) VALUES
('Jazz', 6, 12, 10, '2023-09-07', 2000, 150, 3, 3, 2001, 3, 'ensemble'),
('Classical', 4, 8, 7, '2023-09-08', 2100, 100, 4, 1, 2002, 4, 'ensemble');
-- Insert data into 'address'
INSERT INTO address (street, zip, city) VALUES
('123 Main St', 12345, 'Springfield'),
('456 Elm St', 23456, 'Shelbyville'),
('789 Oak St', 34567, 'Centerville'),
('101 Maple Ave', 45678, 'Mapletown'),
('202 Pine Ln', 56789, 'Laketown'),
('303 Birch Rd', 67890, 'Hillside'),
('404 Cedar St', 78901, 'Riverside'),
('505 Redwood Dr', 89012, 'Cliffview'),
('606 Aspen Ct', 90123, 'Meadowland'),
('707 Willow Way', 11223, 'Sunnyvale');

-- Insert data into 'classroom'
INSERT INTO classroom (person_capacity, street, city, zip) VALUES
(30, '789 Oak St', 'Centerville', 34567),
(25, '321 Pine St', 'Mapletown', 45678),
(20, '543 Cedar Ave', 'Laketown', 56789),
(15, '654 Spruce Blvd', 'Hillside', 67890),
(10, '765 Redwood Path', 'Riverside', 78901);

-- Insert data into 'instruments'
INSERT INTO instruments (instrument_type) VALUES
('Piano'),
('Violin'),
('Guitar'),
('Drums'),
('Flute'),
('Clarinet'),
('Trumpet'),
('Saxophone'),
('Cello'),
('Double Bass');

-- Insert data into 'person'
INSERT INTO person (first_name, last_name, personal_number, phone_number, email_adress, street, city, zip) VALUES
('John', 'Doe', 1001, '555-1234', 'johndoe@email.com', '123 Main St', 'Springfield', 12345),
('Jane', 'Smith', 1002, '555-5678', 'janesmith@email.com', '456 Elm St', 'Shelbyville', 23456),
('Alice', 'Johnson', 1003, '555-1011', 'alicej@email.com', '789 Oak St', 'Centerville', 34567),
('Bob', 'Brown', 1004, '555-2022', 'bobb@email.com', '101 Maple Ave', 'Mapletown', 45678),
('Carol', 'Davis', 1005, '555-3033', 'carold@email.com', '202 Pine Ln', 'Laketown', 56789),
('David', 'Miller', 1006, '555-4044', 'davidm@email.com', '303 Birch Rd', 'Hillside', 67890),
('Eve', 'Wilson', 1007, '555-5055', 'evew@email.com', '404 Cedar St', 'Riverside', 78901),
('Frank', 'Taylor', 1008, '555-6066', 'frankt@email.com', '505 Redwood Dr', 'Cliffview', 89012),
('Grace', 'Anderson', 1009, '555-7077', 'gracea@email.com', '606 Aspen Ct', 'Meadowland', 90123),
('Henry', 'Thomas', 1010, '555-8088', 'henryt@email.com', '707 Willow Way', 'Sunnyvale', 11223),
('Ivy', 'Jackson', 1011, '555-9099', 'ivyj@email.com', '808 Palm St', 'Oakville', 22334),
('Jake', 'White', 1012, '555-1212', 'jakew@email.com', '909 Fir Ave', 'Pinecrest', 33445),
('Kara', 'Harris', 1013, '555-1313', 'karah@email.com', '1010 Birch Ln', 'Elmwood', 44556),
('Leo', 'Martin', 1014, '555-1414', 'leom@email.com', '1111 Cedar Ct', 'Maple Grove', 55667),
('Mia', 'Garcia', 1015, '555-1515', 'miag@email.com', '1212 Spruce Path', 'Linden Town', 66778),
('Nate', 'Robinson', 1016, '555-1616', 'nater@email.com', '1313 Oak Dr', 'Evergreen', 77889),
('Olivia', 'Lopez', 1017, '555-1717', 'olivial@email.com', '1414 Pine St', 'Brookside', 88990),
('Paul', 'Lee', 1018, '555-1818', 'paul@email.com', '1515 Maple Rd', 'Cedarville', 99011),
('Quinn', 'Young', 1019, '555-1919', 'quinny@email.com', '1616 Birch Blvd', 'Forest Hill', 101112),
('Rachel', 'Hernandez', 1020, '555-2020', 'rachelh@email.com', '1717 Cedar Ave', 'Willow Creek', 112113);

-- Insert data into 'price_scheme'
INSERT INTO price_scheme (price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_type) VALUES
(50, 10, TRUE, 20, 'individual', 'beginner'),
(70, 15, FALSE, 30, 'group', 'intermediate'),
(90, 20, TRUE, 40, 'ensemble', 'advanced'),
(60, 0, FALSE, 25, 'individual', 'intermediate'),
(80, 5, TRUE, 35, 'group', 'beginner');

-- Insert data into 'rental_instruments'
INSERT INTO rental_instruments (quantity_in_stock, brand, instruments_id) VALUES
(5, 'Yamaha', 1),
(4, 'Fender', 2),
(6, 'Gibson', 3),
(3, 'Pearl', 4),
(2, 'Flute Brand', 5),
(7, 'Clarinet Brand', 6),
(5, 'Trumpet Brand', 7),
(4, 'Saxophone Brand', 8),
(3, 'Cello Brand', 9),
(6, 'Double Bass Brand', 10);

-- Insert data into 'student'
INSERT INTO student (person_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

-- Insert data into 'contact_person'
INSERT INTO contact_person (relation, person_id) VALUES
('Parent', 1),
('Parent', 2),
('Guardian', 3),
('Parent', 4),
('Parent', 5),
('Guardian', 6),
('Parent', 7),
('Parent', 8),
('Guardian', 9),
('Parent', 10);

-- Insert data into 'instructor'
INSERT INTO instructor (teaches_ensembles, person_id) VALUES
(TRUE, 11),
(FALSE, 12),
(TRUE, 13),
(FALSE, 14),
(TRUE, 15);

-- Insert data into 'instructor_instruments'
INSERT INTO instructor_instruments (instruments_id, instructor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert data into 'lesson'
INSERT INTO lesson (date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type) VALUES
('2023-12-01', '10:00:00', 60, 1, 1, 1, 1, 'individual'),
('2023-12-02', '11:00:00', 90, 2, 2, 2, 2, 'group'),
('2023-12-03', '13:00:00', 120, 3, 3, 3, 3, 'ensemble'),
('2023-12-04', '14:00:00', 60, 4, 4, 4, 4, 'individual'),
('2023-12-05', '15:00:00', 90, 5, 5, 5, 5, 'group');

-- Insert data into 'lesson_attendees'
INSERT INTO lesson_attendees (student_id, lesson_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

-- Continue inserting data into 'rental_record'
INSERT INTO rental_record (rental_period, rental_price, student_id, rental_instruments_id) VALUES
('2023-12-02', 25, 2, 2),
('2023-12-03', 30, 3, 3),
('2023-12-04', 20, 4, 4),
('2023-12-05', 15, 5, 5),
('2023-12-06', 35, 6, 6),
('2023-12-07', 20, 7, 7),
('2023-12-08', 25, 8, 8),
('2023-12-09', 30, 9, 9),
('2023-12-10', 35, 10, 10);

-- Insert data into 'student_relations'
INSERT INTO student_relations (student_id, contact_person_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert data into 'group_lesson'
INSERT INTO group_lesson (min_attendees, max_attendees, attendees, date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type) VALUES
(5, 15, 10, '2023-12-06', '09:00:00', 90, 2, 2, 2, 2, 'group'),
(3, 10, 7, '2023-12-07', '11:00:00', 60, 3, 3, 3, 3, 'group'),
(4, 12, 8, '2023-12-08', '10:30:00', 120, 4, 4, 4, 4, 'group'),
(6, 18, 12, '2023-12-09', '12:00:00', 90, 5, 5, 5, 5, 'group');

-- Insert data into 'sibling_relations'
INSERT INTO sibling_relations (student_id, sibling_student_id) VALUES
(1, 2),
(3, 4),
(5, 6),
(7, 8),
(9, 10);

-- Insert data into 'ensemble'
INSERT INTO ensemble (genre, min_attendees, max_attendees, attendees, date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type) VALUES
('Jazz', 10, 20, 15, '2023-12-10', '14:00:00', 120, 1, 1, 1, 1, 'ensemble'),
('Classical', 8, 16, 12, '2023-12-11', '15:00:00', 90, 3, 3, 3, 3, 'ensemble'),
('Rock', 12, 24, 18, '2023-12-12', '16:00:00', 120, 4, 4, 4, 4, 'ensemble'),
('Pop', 7, 14, 10, '2023-12-13', '17:00:00', 90, 5, 5, 5, 5, 'ensemble');
