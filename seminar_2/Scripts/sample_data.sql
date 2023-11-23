-- Insert into person and capture the generated IDs
WITH inserted_person AS (
    INSERT INTO person (first_name, last_name, personal_number, phone_number, email_address, street, city, zip)
    VALUES
        ('John', 'Doe', 123456789, 5551234, 'john.doe@example.com', '123 Main St', 'Anytown', 12345),
        ('Jane', 'Smith', 987654321, 5555678, 'jane.smith@example.com', '456 Elm St', 'Othertown', 54321),
        ('Alice', 'Brown', 234567890, 5556789, 'alice.brown@example.com', '789 Cedar St', 'Middletown', 23456)
    RETURNING id
)
-- Insert into instructor using the captured person IDs
, inserted_instructor AS (
    INSERT INTO instructor (teaches_ensembles, person_id)
    SELECT TRUE, id FROM inserted_person
    RETURNING id
)
-- Insert into classroom and capture the IDs
, inserted_classroom AS (
    INSERT INTO classroom (room_size, street, city, zip)
    VALUES
        (25, '789 Maple St', 'Sometown', 67890),
        (30, '321 Oak St', 'Newtown', 98765)
    RETURNING id
)
-- Insert into price_scheme and capture the IDs
, inserted_price_scheme AS (
    INSERT INTO price_scheme (price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_type)
    VALUES
        (100, 10, TRUE, 50, 'individual', 'beginner'),
        (150, 15, FALSE, 75, 'group', 'intermediate')
    RETURNING id
)
-- Insert into instruments and capture the IDs
, inserted_instruments AS (
    INSERT INTO instruments (instrument_type)
    VALUES
        ('Guitar'),
        ('Piano')
    RETURNING id
)
-- Insert into lesson using the captured IDs
, inserted_lesson AS (
    INSERT INTO lesson (date, start_time, duration, room_id, price_scheme_id, instructor_id, instrument_id)
    SELECT '2023-01-10', 1400, 60, classroom.id, price_scheme.id, instructor.id, instrument.id
    FROM inserted_classroom classroom, inserted_price_scheme price_scheme, inserted_instructor instructor, inserted_instruments instrument
    WHERE classroom.id = 1 AND price_scheme.id = 1 AND instructor.id = 1 AND instrument.id = 1
    RETURNING id
)
-- Insert into student using the captured person IDs
, inserted_student AS (
    INSERT INTO student (person_id)
    SELECT id FROM inserted_person
    RETURNING id
)
-- Insert into rental_instruments using the captured instrument IDs
, inserted_rental_instruments AS (
    INSERT INTO rental_instruments (quantity_in_stock, brand, instrument_id)
    SELECT 10, 'Yamaha', id FROM inserted_instruments
    RETURNING id
)
-- Insert into rental_record using the captured student and rental instrument IDs
, inserted_rental_record AS (
    INSERT INTO rental_record (rental_period, rental_price, student_id, rental_instruments_id)
    SELECT '2023-01-10', 25, student.id, rental_instrument.id
    FROM inserted_student student, inserted_rental_instruments rental_instrument
    WHERE student.id = 1 AND rental_instrument.id = 1
    RETURNING id
)
-- Insert into lesson_attendees using the captured student and lesson IDs
, inserted_lesson_attendees AS (
    INSERT INTO lesson_attendees (student_id, lesson_id)
    SELECT student.id, lesson.id
    FROM inserted_student student, inserted_lesson lesson
    WHERE student.id = 1 AND lesson.id = 1
    RETURNING student_id, lesson_id
)
-- Insert into instructor_instruments using the captured instructor and instrument IDs
, inserted_instructor_instruments AS (
    INSERT INTO instructor_instruments (instruments_id, instructor_id)
    SELECT instrument.id, instructor.id
    FROM inserted_instruments instrument, inserted_instructor instructor
    WHERE instrument.id = 1 AND instructor.id = 1
    RETURNING id
)
-- Insert into contact_person using the captured person IDs
, inserted_contact_person AS (
    INSERT INTO contact_person (relation, person_id)
    SELECT 'Parent', id FROM inserted_person
    RETURNING id
)
-- Insert into student_relations using the captured student and contact person IDs
, inserted_student_relations AS (
    INSERT INTO student_relations (student_id, contact_id)

-- Insert into student_relations using the captured student and contact person IDs
, inserted_student_relations AS (
    INSERT INTO student_relations (student_id, contact_id)
    SELECT student.id, contact_person.id
    FROM inserted_student student, inserted_contact_person contact_person
    WHERE student.id = 1 AND contact_person.id = 1
    RETURNING student_id, contact_id
)
-- Insert into sibling_relations using the captured student IDs
, inserted_sibling_relations AS (
    INSERT INTO sibling_relations (student_id, sibling_student_id)
    SELECT student1.id, student2.id
    FROM inserted_student student1, inserted_student student2
    WHERE student1.id <> student2.id
    RETURNING id
)
-- Insert into group_lesson using the captured lesson IDs
, inserted_group_lesson AS (
    INSERT INTO group_lesson (lesson_id, min_attendees, max_attendees, attendees)
    SELECT lesson.id, 5, 10, 7
    FROM inserted_lesson lesson
    WHERE lesson.id = 1
    RETURNING lesson_id
)
-- Insert into ensemble using the captured lesson IDs
INSERT INTO ensemble (lesson_id, min_attendees, max_attendees, attendees, genre)
SELECT lesson.id, 6, 12, 8, 'Jazz'
FROM inserted_lesson lesson
WHERE lesson.id = 1;
