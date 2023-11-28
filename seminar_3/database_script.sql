-- ENUM types definition
CREATE TYPE lesson_type AS ENUM ('individual', 'group', 'ensemble');
CREATE TYPE skill_type AS ENUM ('beginner', 'intermediate', 'advanced');

-- Table creation for 'person'
CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 first_name VARCHAR(20),
 last_name VARCHAR(20),
 personal_number CHAR(11) UNIQUE,
 phone_number VARCHAR(20),
 email_address VARCHAR(50) UNIQUE,
 street VARCHAR(30),
 city VARCHAR(20),
 zip VARCHAR(10)
);

-- Table creation for 'student'
CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 person_id INT NOT NULL,
 FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE
);

-- Table creation for 'contact_person'
CREATE TABLE contact_person (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 relation VARCHAR(20),
 person_id INT NOT NULL,
 FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE
);

-- Table creation for 'instructor'
CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 teaches_ensembles BOOLEAN,
 person_id INT NOT NULL,
 FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE
);

-- Table creation for 'student_relations'
CREATE TABLE student_relations (
 student_id INT NOT NULL,
 contact_person_id INT NOT NULL,
 PRIMARY KEY (student_id, contact_person_id),
 FOREIGN KEY (student_id) REFERENCES student(id),
 FOREIGN KEY (contact_person_id) REFERENCES contact_person(id)
);

-- Table creation for 'sibling_relations'
CREATE TABLE sibling_relations (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 student_id INT NOT NULL,
 sibling_student_id INT NOT NULL,
 FOREIGN KEY (student_id) REFERENCES student(id),
 FOREIGN KEY (sibling_student_id) REFERENCES student(id)
);

-- Table creation for 'instruments'
CREATE TABLE instruments (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 instrument_type VARCHAR(20) NOT NULL
);

-- Table creation for 'instructor_instruments'
CREATE TABLE instructor_instruments (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 instruments_id INT NOT NULL,
 instructor_id INT NOT NULL,
 FOREIGN KEY (instruments_id) REFERENCES instruments(id) ON DELETE CASCADE,
 FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);

-- Table creation for 'rental_instruments'
CREATE TABLE rental_instruments (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 rental_price INT,
 quantity_in_stock INT,
 brand VARCHAR(20),
 instruments_id INT NOT NULL,
 FOREIGN KEY (instruments_id) REFERENCES instruments(id) ON DELETE CASCADE
);

-- Table creation for 'rental_record'
CREATE TABLE rental_record (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 rental_period DATE,
 student_id INT NOT NULL,
 rental_instruments_id INT NOT NULL,
 FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE SET NULL,
 FOREIGN KEY (rental_instruments_id) REFERENCES rental_instruments(id) ON DELETE SET NULL
);

-- Table creation for 'classroom'
CREATE TABLE classroom (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 person_capacity INT NOT NULL,
 street VARCHAR(30),
 city VARCHAR(20),
 zip VARCHAR(10)
);

-- Table creation for 'price_scheme'
CREATE TABLE price_scheme (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 price INT NOT NULL,
 discount DECIMAL(3, 2) CHECK (discount >= 0 AND discount <= 1),
 sibling_discount_eligibility BOOLEAN,
 instructor_fee INT,
 lesson_type lesson_type NOT NULL,
 skill_type skill_type NOT NULL
);

-- Table creation for 'lesson'
CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 date DATE,
 start_time TIME,
 duration INTERVAL,
 classroom_id INT,
 price_scheme_id INT,
 instructor_id INT,
 instruments_id INT,
 lesson_type lesson_type,
 FOREIGN KEY (classroom_id) REFERENCES classroom(id),
 FOREIGN KEY (price_scheme_id) REFERENCES price_scheme(id),
 FOREIGN KEY (instructor_id) REFERENCES instructor(id),
 FOREIGN KEY (instruments_id) REFERENCES instruments(id)
);

-- Table creation for 'group_lesson'
CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 min_attendees INT,
 max_attendees INT,
 attendees INT,
 PRIMARY KEY (lesson_id),
 FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE
);

-- Table creation for 'ensemble'
CREATE TABLE ensemble (
 lesson_id INT NOT NULL,
 min_attendees INT,
 max_attendees INT,
 attendees INT,
 genre VARCHAR(20),
 PRIMARY KEY (lesson_id),
 FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE
);

-- Table creation for 'lesson_attendees'
CREATE TABLE lesson_attendees (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL,
 PRIMARY KEY (student_id, lesson_id),
 FOREIGN KEY (student_id) REFERENCES student(id),
 FOREIGN KEY (lesson_id) REFERENCES lesson(id)
);
