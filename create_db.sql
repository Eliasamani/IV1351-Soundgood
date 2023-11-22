-- ENUM types definition
CREATE TYPE lesson_type AS ENUM ('individual', 'group', 'ensemble');
CREATE TYPE skill_type AS ENUM ('beginner', 'intermediate', 'advanced');

-- Table person
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    personal_number INT,
    phone_number INT,
    email_address VARCHAR(30),
    street VARCHAR(30),
    city VARCHAR(20),
    zip INT
);

-- Table price_scheme
CREATE TABLE price_scheme (
    id SERIAL PRIMARY KEY,
    price INT,
    discount INT,
    sibling_discount_eligibility BOOLEAN,
    instructor_fee INT,
    lesson_type lesson_type,
    skill_type skill_type
);

-- Table classroom
CREATE TABLE classroom (
    id SERIAL PRIMARY KEY,
    room_size INT,
    street VARCHAR(30),
    city VARCHAR(20),
    zip INT
);

-- Table lesson
CREATE TABLE lesson (
    id SERIAL PRIMARY KEY,
    date DATE,
    start_time INT,
    duration INT,
    room_id SERIAL REFERENCES classroom(id) ON DELETE SET NULL,
    price_scheme_id SERIAL REFERENCES price_scheme(id) ON DELETE CASCADE,
    instructor_id SERIAL,
    instrument_id SERIAL
);

-- Table instructor
CREATE TABLE instructor (
    id SERIAL PRIMARY KEY,
    teaches_ensembles BOOLEAN,
    person_id SERIAL REFERENCES person(id) ON DELETE CASCADE
);

-- Additional relationships for the lesson table
ALTER TABLE lesson ADD FOREIGN KEY (instructor_id) REFERENCES instructor(id);

-- Table student
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    person_id SERIAL REFERENCES person(id) ON DELETE CASCADE
);

-- Table instruments
CREATE TABLE instruments (
    id SERIAL PRIMARY KEY,
    instrument_type VARCHAR(20)
);

-- Table rental_instruments
CREATE TABLE rental_instruments (
    id SERIAL PRIMARY KEY,
    quantity_in_stock INT,
    brand VARCHAR(20),
    instrument_id SERIAL REFERENCES instruments(id)
);

-- Table rental_record
CREATE TABLE rental_record (
    id SERIAL PRIMARY KEY,
    rental_period DATE,
    rental_price INT,
    student_id SERIAL REFERENCES student(id),
    rental_instruments_id SERIAL REFERENCES rental_instruments(id)
);

-- Table lesson_attendees
CREATE TABLE lesson_attendees (
    student_id SERIAL REFERENCES student(id),
    lesson_id SERIAL REFERENCES lesson(id),
    PRIMARY KEY (student_id, lesson_id)
);

-- Table instructor_instruments
CREATE TABLE instructor_instruments (
    id SERIAL PRIMARY KEY,
    instruments_id SERIAL REFERENCES instruments(id),
    instructor_id SERIAL REFERENCES instructor(id)
);

-- Table contact_person
CREATE TABLE contact_person (
    id SERIAL PRIMARY KEY,
    relation VARCHAR(20),
    person_id SERIAL REFERENCES person(id) ON DELETE CASCADE
);

-- Table student_relations
CREATE TABLE student_relations (
    student_id SERIAL REFERENCES student(id),
    contact_id SERIAL REFERENCES contact_person(id),
    PRIMARY KEY (student_id, contact_id)
);

-- Table sibling_relations
CREATE TABLE sibling_relations (
    id SERIAL PRIMARY KEY,
    student_id SERIAL REFERENCES student(id),
    sibling_student_id SERIAL REFERENCES student(id)
);

-- Table group_lesson
CREATE TABLE group_lesson (
    lesson_id SERIAL REFERENCES lesson(id) ON DELETE CASCADE,
    min_attendees INT,
    max_attendees INT,
    attendees INT,
    PRIMARY KEY (lesson_id)
);

-- Table ensemble
CREATE TABLE ensemble (
    lesson_id SERIAL REFERENCES lesson(id) ON DELETE CASCADE,
    min_attendees INT,
    max_attendees INT,
    attendees INT,
    genre VARCHAR(20),
    PRIMARY KEY (lesson_id)
);
