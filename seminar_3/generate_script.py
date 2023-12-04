from datetime import datetime, timedelta
from faker import Faker
import random

nr_of_students = 400
nr_of_instructors = 30
nr_of_classrooms = 10
max_siblings = 2
discount = 0
year_range = range(2021, 2024)
min_lessons = 1000
max_lessons = 2000

# Set the locale to Swedish
fake = Faker('sv_SE')

# List of possible relations
relations = [
    "Parent",
    "Guardian",
    "Sibling",
    "Grandparent",
    "Aunt",
    "Uncle",
    "Cousin",
    "Family Friend",
    "Girlfriend",
    "Boyfriend",
    "Spouce",
]

# List of 10 random musical instruments
instruments = [
    'Cello',
    'Trumpet',
    'Saxophone',
    'Clarinet',
    'Harp',
    'Violin',
    'Guitar',
    'Trombone',
    'Drums',
    'Piano'
]

instrument_ids = list(range(1, len(instruments)+1))

# List of instrument brands
brands = [
    'Yamaha', 
    'Steinway & Sons', 
    'Gibson', 
    'Fender', 
    'Ibanez',
    'Roland', 
    'Kawai', 
    'Martin', 
    'Taylor', 
    'Selmer'
]

skill_levels = [
    'Beginner',
    'Intermediate',
    'Advanced',
]

lesson_types = [
    'Individual',
    'Group',
    'Ensemble',
]

lesson_durations = [
    '1 hour',
    '1 hour 15 mins',
    '1 hour 30 mins',
    '1 hour 45 mins',
    '2 hours',
]

ensemble_genres = [
    'Jazz', 
    'Rock', 
    'Classical', 
    'Blues', 
    'Pop'
]

generated_names = set()
def generate_unique_email(first_name, last_name):
    # Generate a random number or timestamp
    unique_identifier = str(random.randint(100, 999))
    domain = fake.free_email_domain()
    email = f"{first_name.lower()}.{last_name.lower()}{unique_identifier}@{domain}"
    return email

def create_person():
    first_name = fake.first_name()
    last_name = fake.last_name()
    personal_number = fake.ssn(min_age=40, max_age=60, long=False, dash=True)
    phone = fake.phone_number()
    email = generate_unique_email(first_name, last_name)
    street = fake.street_address()
    city = fake.city()
    zip = fake.postcode()
    return (first_name, last_name, personal_number, phone, email, street, city, zip)

def create_classroom():
    person_capacity = fake.random_int(min=3, max=15)
    street = fake.street_address()
    city = fake.city()
    zip = fake.postcode()
    return (person_capacity, street, city, zip)

def create_contact_person(last_name):
    is_parent = bool(random.getrandbits(1)) # Randomly decide if the contact person is a parent

    first_name = fake.first_name()
    last_name = last_name if is_parent else fake.last_name()
    personal_number = fake.ssn(min_age=30, max_age=60, long=False, dash=True)
    phone = fake.phone_number()
    email = generate_unique_email(first_name, last_name)
    street = fake.street_address()
    city = fake.city()
    zip_code = fake.postcode()
    
    relation = "Parent" if is_parent else random.choice(relations)
    
    return (
        (first_name, last_name, personal_number, phone, email, street, city, zip_code),
        (relation)
    )

def create_family(siblings_count, last_name):
    siblings = []
    for _ in range(siblings_count):
        first_name = fake.first_name()
        personal_number = fake.ssn(min_age=14, max_age=30, long=False, dash=True)
        phone = fake.phone_number()
        email = generate_unique_email(first_name, last_name)
        address = fake.street_address()
        city = fake.city()
        zip_code = fake.postcode()
        siblings.append((f"'{first_name}'", f"'{last_name}'", f"'{personal_number}'", 
        f"'{phone}'", f"'{email}'", f"'{address}'", f"'{city}'", f"'{zip_code}'"))
    return siblings

def distribute_students_to_families(total_students, max_siblings_per_family):
    families = []
    contacts = []
    while total_students > 0:
        siblings_count = random.randint(1, min(max_siblings_per_family+1, total_students))
        last_name = fake.last_name()
        family = create_family(siblings_count, last_name)
        families.append(family)

        # Create one contact person per family
        contact = create_contact_person(last_name)
        contacts.append(contact)

        total_students -= siblings_count
    return families, contacts

families, contacts = distribute_students_to_families(nr_of_students, max_siblings)
students = [student for family in families for student in family]
instructors = [create_person() for instructor in range(nr_of_instructors)]
classrooms = [create_classroom() for classroom in range(nr_of_classrooms)]

def create_sibling_relations(families):
    sibling_relations = []
    student_id = 1
    for family in families:
        for _ in family:
            for sibling in family:
                if sibling != _:
                    sibling_relations.append((student_id, student_id + family.index(sibling)))
            student_id += 1
    return sibling_relations

sibling_relations = create_sibling_relations(families)

def create_student_relations(families):
    student_relations = []
    student_id = 1
    contact_person_id = 1

    for family in families:
        # Each family has a contact person, so assign the first student of each family to the contact person
        for _ in family:
            student_relations.append((student_id, contact_person_id))
            student_id += 1  # Move to the next student
        contact_person_id += 1  # Move to the next contact person after assigning the whole family

    return student_relations

def generate_instructor_instruments(nr_of_instructors, instrument_ids):
    instructor_instruments = {}
    for instructor_id in range(1, nr_of_instructors + 1):
        nr_of_instruments = random.randint(1, 2)
        known_instruments = random.sample(instrument_ids, nr_of_instruments)
        instructor_instruments[instructor_id] = known_instruments
    return instructor_instruments

def generate_price_schemes(lesson_types, skill_levels):
    price_schemes = {}
    price_scheme_id = 1  # Starting ID for price schemes

    for lesson_type in lesson_types:
        for skill_level in skill_levels:
            lesson_price = random.randint(4, 10) * 100
            instructor_fee = int(lesson_price * 0.3)
            sibling_discount_eligibility = True
            price_schemes[(lesson_type, skill_level)] = (price_scheme_id, lesson_price, discount, sibling_discount_eligibility, instructor_fee)
            price_scheme_id += 1
    return price_schemes

def get_classroom_id(min_capacity):
    # Choose a classroom that meets the minimum capacity requirement
    suitable_classrooms = [i + 1 for i, classroom in enumerate(classrooms) if classroom[0] >= min_capacity]
    return random.choice(suitable_classrooms) if suitable_classrooms else None

instructor_instruments = generate_instructor_instruments(nr_of_instructors, instrument_ids)
def get_instructor_id(lesson_type, instrument_id=None):
    suitable_instructors = [instructor_id for instructor_id, instruments in instructor_instruments.items() if (lesson_type == 'ensemble' or instrument_id in instruments)]
    return random.choice(suitable_instructors) if suitable_instructors else None


def get_price_scheme_id(lesson_type, skill_level, price_schemes):
    return price_schemes.get((lesson_type, skill_level))[0] if (lesson_type, skill_level) in price_schemes else None

def random_date(year_range):
    year = random.choice(year_range)
    start_date = datetime(year, 1, 1)
    end_date = datetime(year, 12, 31)
    delta = end_date - start_date
    random_days = random.randint(1, delta.days)
    random_date = start_date + timedelta(days=random_days)
    return random_date.strftime('%Y-%m-%d')

def random_time():
    # Assuming lessons can start any time between 8:00 and 20:00
    hour = random.randint(8, 20)
    minute = random.choice(['00', '15', '30', '45'])
    return f"{hour:02d}:{minute}"

with open('data_script.sql', 'w', encoding='utf-8') as file:
    file.write("TRUNCATE TABLE \n\
    student_relations, \n\
    sibling_relations, \n\
    rental_record, \n\
    lesson_attendees, \n\
    lesson, \n\
    instructor_instruments, \n\
    instructor, \n\
    contact_person, \n\
    student, \n\
    rental_instruments, \n\
    price_scheme, \n\
    person, \n\
    instruments, \n\
    group_lesson, \n\
    ensemble, \n\
    classroom \n\
    RESTART IDENTITY CASCADE;\n\n")

    file.write("INSERT INTO person (first_name, last_name, personal_number, phone_number, email_address, street, city, zip)\n")
    file.write("VALUES\n")

    # Insert students
    file.write(f"-- {nr_of_students} students\n")
    for student in students:
        student_values = ", ".join(map(str, student))  # Convert each element to string and join
        file.write(f" ({student_values}),\n")

    # Insert contacts
    file.write(f"-- {len(contacts)} contacts\n")
    for contact in contacts:
        file.write(f" {contact[0]},\n")
    
    # Insert instructors
    file.write(f"-- {nr_of_instructors} instructors\n")
    for instructor in instructors:
        file.write(f" {instructor},\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Insert " + str(nr_of_students) + " students (person IDs 1-" + str(nr_of_students) + ")\n")
    file.write(" INSERT INTO student (person_id)\n")
    file.write(" SELECT id FROM person WHERE id BETWEEN 1 AND " + str(nr_of_students) + ";\n\n")

    file.write("-- Insert contacts\n")
    file.write("INSERT INTO contact_person (relation, person_id)\nVALUES\n")
    contact_id = len(students) + 1
    for contact in contacts:
        file.write(f" ('{contact[1]}', {contact_id}),\n")  # Insert relation and contact_id
        contact_id += 1
    file.seek(file.tell() - 3, 0)
    file.write(";\n\n")

    instructor_id = nr_of_students + len(contacts) + 1
    file.write("-- Insert " + str(nr_of_instructors) + " instructors (person IDs " + str(instructor_id) + "-" + str(instructor_id + nr_of_instructors) + ")\n")
    file.write("INSERT INTO instructor (teaches_ensembles, person_id)\n")
    file.write("VALUES\n")
    for instructor in instructors:
        file.write(f"  ({bool(random.getrandbits(1))}, {instructor_id}),\n")
        instructor_id += 1
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    student_relations = create_student_relations(families)
    file.write("-- Create student_relations between students and contact persons\n")
    file.write("INSERT INTO student_relations (student_id, contact_person_id)\n")
    file.write("VALUES\n")
    for relation in student_relations:
        file.write(f"  ({relation[0]}, {relation[1]}),\n")
    # Remove the last comma
    file.seek(file.tell() - 3, 0)  
    file.write(";\n\n")

    sibling_relations = create_sibling_relations(families)
    file.write("-- Create sibling relations\n")
    file.write("INSERT INTO sibling_relations (student_id, sibling_student_id)\n")
    file.write("VALUES\n")
    for sibling_relation in sibling_relations:
            file.write(f"  {sibling_relation},\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Create 10 instruments\n")
    file.write("INSERT INTO instruments (instrument_type)\n")
    file.write("VALUES\n")
    for instrument in instruments:
            file.write(f"('{instrument}'),\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Insert random data into instructor_instruments\n")
    file.write("INSERT INTO instructor_instruments (instructor_id, instruments_id)\n")
    file.write("VALUES\n")
    for instructor_id, instruments in instructor_instruments.items():
        for instrument_id in instruments:
            file.write(f"  ({instructor_id}, {instrument_id}),\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Create rental instruments with price\n")
    file.write("INSERT INTO rental_instruments (rental_price, quantity_in_stock, brand, instruments_id)\n")
    file.write("VALUES\n")
    for instrument_id in instrument_ids:
        quantity = random.randint(2, 5)  # Random quantity between 2 and 5
        rental_price = random.randint(4, 14) * 50  # Random rental price between 200 and 700, in increments of 50
        brand = random.choice(brands)  # Randomly select a brand

        file.write(f"  ({rental_price}, {quantity}, '{brand}', {instrument_id}),\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Create rental records\n")
    file.write("INSERT INTO rental_record (rental_period, student_id, rental_instruments_id)\n")
    file.write("VALUES\n")
    nr_of_rental_records = random.randint(5, 15)
    for record in range(nr_of_rental_records):
        rental_date = random_date(year_range)
        student_id = random.randint(1, nr_of_students)
        instrument_id = random.randint(1, len(instruments))

        file.write(f"  ('{rental_date}', {student_id}, {instrument_id}),\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Create classrooms\n")
    file.write("INSERT INTO classroom (person_capacity, street, city, zip)\n")
    file.write("VALUES\n")
    for classroom in classrooms:
        file.write(f"  {classroom},\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    price_schemes = generate_price_schemes(lesson_types, skill_levels)
    file.write("-- Create price schemes\n")
    file.write("INSERT INTO price_scheme (price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_level)\n")
    file.write("VALUES\n")
    for (lesson_type, skill_level), (price_scheme_id, lesson_price, discount, sibling_discount_eligibility, instructor_fee) in price_schemes.items():
        file.write(f"  ({lesson_price}, {discount}, {sibling_discount_eligibility}, {instructor_fee}, '{lesson_type}', '{skill_level}'),\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    group_lessons = []
    ensemble_lessons = []
    lesson_id = 1

    file.write("-- Insert lessons\n")
    file.write("INSERT INTO lesson (date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type)\n")
    file.write("VALUES\n")
    lesson_attendees_info = []  # List to store attendees information for group and ensemble lessons

    for lesson_type in lesson_types:
        nr_of_lessons = random.randint(min_lessons, max_lessons)
        for lesson in range(nr_of_lessons):
            instructor_id = get_instructor_id(lesson_type, None if lesson_type == 'ensemble' else random.choice(instrument_ids))
            
            if instructor_id is None:
                continue  # Skip this lesson as no suitable instructor is available

            date = random_date(year_range)
            start_time = random_time()
            duration = random.choice(lesson_durations)

            if lesson_type in ['Group', 'Ensemble']:
                attendees = random.randint(3, 14)
                min_attendees = random.randint(3, attendees)
                max_attendees = random.randint(attendees, 14)
                classroom_id = get_classroom_id(max_attendees)
                lesson_attendees_info.append((lesson_id, attendees))

                if lesson_type == 'Group':
                    group_lessons.append((lesson_id, min_attendees, max_attendees, attendees))
                else:
                    genre = random.choice(ensemble_genres)
                    ensemble_lessons.append((lesson_id, min_attendees, max_attendees, attendees, genre))
            else:
                classroom_id = get_classroom_id(1)

            skill_level = random.choice(skill_levels)
            price_scheme_id = get_price_scheme_id(lesson_type, skill_level, price_schemes)
            instrument_id = 'NULL' if lesson_type == 'ensemble' else random.choice(instrument_ids)

            file.write(f"  ('{date}', '{start_time}', '{duration}', {classroom_id}, {price_scheme_id}, {instructor_id}, {instrument_id}, '{lesson_type}'),\n")
            lesson_id += 1

    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Insert group lessons\n")
    file.write("INSERT INTO group_lesson (lesson_id, min_attendees, max_attendees, attendees)\n")
    file.write("VALUES\n")
    for group_lesson in group_lessons:
        file.write(f"  {group_lesson},\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Insert ensemble lessons\n")
    file.write("INSERT INTO ensemble (lesson_id, min_attendees, max_attendees, attendees, genre)\n")
    file.write("VALUES\n")
    for ensemble_lesson in ensemble_lessons:
        file.write(f"  {ensemble_lesson},\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    # Calculate total number of lessons generated
    total_lessons = lesson_id - 1

    file.write("-- Insert lesson attendees for all lessons\n")
    file.write("INSERT INTO lesson_attendees (student_id, lesson_id)\n")
    file.write("VALUES\n")

    group_ensemble_lesson_ids = {lesson_id for lesson_id, _ in lesson_attendees_info}

    # Dictionary to hold attendees for each lesson
    attendees_per_lesson = {}

    for lesson_id in range(1, total_lessons + 1):
        if lesson_id in group_ensemble_lesson_ids:  # Group or ensemble lesson
            attendees = next(attendees for lesson_id_check, attendees in lesson_attendees_info if lesson_id_check == lesson_id)
            selected_students = random.sample(range(1, nr_of_students + 1), attendees)
        else:  # Individual lesson
            selected_students = [random.randint(1, nr_of_students)]

        attendees_per_lesson[lesson_id] = selected_students

    # Write attendees in grouped format
    for lesson_id, students in attendees_per_lesson.items():
        attendees_str = ', '.join([f"({student_id}, {lesson_id})" for student_id in students])
        file.write(f"  {attendees_str},\n")

    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";")