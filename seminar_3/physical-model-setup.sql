CREATE TYPE lesson_type_enum AS ENUM ('individual', 'group', 'ensemble');
CREATE TYPE skill_type_enum AS ENUM ('beginner', 'intermediate', 'advanced');


CREATE TABLE address (
 street VARCHAR(50),
 zip INT,
 city VARCHAR(20),
 addressID SERIAL NOT NULL
);


CREATE TABLE classroom (
 id SERIAL NOT NULL,
 person_capacity INT NOT NULL,
 street VARCHAR(30),
 city VARCHAR(20),
 zip INT
);

ALTER TABLE classroom ADD CONSTRAINT PK_classroom PRIMARY KEY (id);


CREATE TABLE instruments (
 id SERIAL NOT NULL,
 instrument_type VARCHAR(20) NOT NULL
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (id);


CREATE TABLE person (
 id SERIAL NOT NULL,
 first_name VARCHAR(20),
 last_name VARCHAR(20),
 personal_number INT,
 phone_number VARCHAR(30),
 email_adress VARCHAR(30),
 street VARCHAR(30),
 city VARCHAR(20),
 zip INT
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE price_scheme (
 id SERIAL NOT NULL,
 price INT NOT NULL,
 discount INT,
 sibling_discount_eligibility BOOLEAN,
 instructor_fee INT,
 lesson_type lesson_type_enum NOT NULL,
 skill_type skill_type_enum NOT NULL
);

ALTER TABLE price_scheme ADD CONSTRAINT PK_price_scheme PRIMARY KEY (id);

ALTER TABLE price_scheme ADD CONSTRAINT check_discount_range CHECK (discount BETWEEN 0 AND 100);


CREATE TABLE rental_instruments (
 id SERIAL NOT NULL,
 quantity_in_stock INT,
 brand VARCHAR(20),
 instruments_id SERIAL NOT NULL
);

ALTER TABLE rental_instruments ADD CONSTRAINT PK_rental_instruments PRIMARY KEY (id);

CREATE TABLE student (
 id SERIAL NOT NULL,
 person_id SERIAL NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE contact_person (
 id SERIAL NOT NULL,
 relation VARCHAR(20),
 person_id SERIAL NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


CREATE TABLE instructor (
 id SERIAL NOT NULL,
 teaches_ensembles BOOLEAN,
 person_id SERIAL NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_instruments (
 id SERIAL NOT NULL,
 instruments_id SERIAL NOT NULL,
 instructor_id SERIAL NOT NULL
);

ALTER TABLE instructor_instruments ADD CONSTRAINT PK_instructor_instruments PRIMARY KEY (id);


CREATE TABLE lesson (
 id SERIAL NOT NULL,
 date DATE,
 start_time TIME,
 duration INT,
 classroom_id SERIAL,
 price_scheme_id SERIAL,
 instructor_id SERIAL,
 instruments_id SERIAL,
 lesson_type lesson_type_enum
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE lesson_attendees (
 student_id SERIAL NOT NULL,
 lesson_id SERIAL
);


CREATE TABLE rental_record (
 id SERIAL NOT NULL,
 rental_period DATE,
 rental_price INT,
 student_id SERIAL NOT NULL,
 rental_instruments_id SERIAL NOT NULL
);

ALTER TABLE rental_record ADD CONSTRAINT PK_rental_record PRIMARY KEY (id);


CREATE TABLE student_relations (
 student_id SERIAL NOT NULL,
 contact_person_id SERIAL NOT NULL
);

ALTER TABLE student_relations ADD CONSTRAINT PK_student_relations PRIMARY KEY (student_id);


CREATE TABLE group_lesson (
 min_attendees INT,
 max_attendees INT,
 attendees INT
) INHERITS (lesson);



CREATE TABLE sibling_relations (
 id SERIAL NOT NULL,
 student_id SERIAL NOT NULL,
 sibling_student_id SERIAL NOT NULL
);

ALTER TABLE sibling_relations ADD CONSTRAINT PK_sibling_relations PRIMARY KEY (id);


CREATE TABLE ensemble (
 genre VARCHAR(20)
)INHERITS(group_lesson);



ALTER TABLE rental_instruments ADD CONSTRAINT FK_rental_instruments FOREIGN KEY (instruments_id) REFERENCES instruments (id);



ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor_instruments ADD CONSTRAINT FK_instructor_instruments_0 FOREIGN KEY (instruments_id) REFERENCES instruments (id);
ALTER TABLE instructor_instruments ADD CONSTRAINT FK_instructor_instruments_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (classroom_id) REFERENCES classroom (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (price_scheme_id) REFERENCES price_scheme (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_3 FOREIGN KEY (instruments_id) REFERENCES instruments (id);


ALTER TABLE lesson_attendees ADD CONSTRAINT FK_lesson_attendees_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE lesson_attendees ADD CONSTRAINT FK_lesson_attendees_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE rental_record ADD CONSTRAINT FK_rental_record_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE rental_record ADD CONSTRAINT FK_rental_record_1 FOREIGN KEY (rental_instruments_id) REFERENCES rental_instruments (id);


ALTER TABLE student_relations ADD CONSTRAINT FK_student_relations_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_relations ADD CONSTRAINT FK_student_relations_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id);


ALTER TABLE sibling_relations ADD CONSTRAINT FK_sibling_relations_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE sibling_relations ADD CONSTRAINT FK_sibling_relations_1 FOREIGN KEY (student_id) REFERENCES student_relations (student_id);




