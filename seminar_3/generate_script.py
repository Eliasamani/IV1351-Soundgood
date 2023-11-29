from datetime import datetime, timedelta
from faker import Faker
import random

nr_of_students = 100
nr_of_contacts = 100
nr_of_instructors = 20
nr_of_classrooms = 10
max_siblings = 2
discount = 0
year_range = range(2018, 2024)
min_lessons = 20
max_lessons = 40

# Set the locale to Swedish
fake = Faker('sv_SE')

generated_names = set()
def unique_name():
    while True:
        first_name = fake.first_name()
        last_name = fake.last_name()
        full_name = first_name + " " + last_name
        if full_name not in generated_names:
            generated_names.add(full_name)
            return first_name, last_name

def create_younger():
    first_name, last_name = unique_name()
    personal_number = fake.ssn(min_age=13, max_age=25, long=False, dash=True)
    phone = fake.phone_number()
    email = first_name.lower() + "." + last_name.lower() + "@" + fake.free_email_domain()
    address = fake.street_address()
    city = fake.city()
    zip_code = fake.postcode()
    return (first_name, last_name, personal_number, phone, email, address, city, zip_code)

def create_older():
    first_name, last_name = unique_name()
    personal_number = fake.ssn(min_age=40, max_age=60, long=False, dash=True)
    phone = fake.phone_number()
    email = first_name.lower() + "." + last_name.lower() + "@" + fake.free_email_domain()
    street = fake.street_address()
    city = fake.city()
    zip = fake.postcode()
    return (first_name, last_name, personal_number, phone, email, street, city, zip)

def create_classroom():
    person_capacity = fake.random_int(min=3, max=30)
    street = fake.street_address()
    city = fake.city()
    zip = fake.postcode()
    return (person_capacity, street, city, zip)

students = [create_younger() for student in range(nr_of_students)]
contacts = [create_older() for contact in range(nr_of_contacts)]
instructors = [create_older() for instructor in range(nr_of_instructors)]
classrooms = [create_classroom() for classroom in range(nr_of_classrooms)]

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

# Function to randomly create sibling relations
def create_sibling_relations(nr_of_students, max_siblings):
    sibling_counts = {i: 0 for i in range(1, nr_of_students + 1)}
    sibling_relations = []

    for student_id in range(1, nr_of_students + 1):
        # Randomly decide how many siblings this student will have, without exceeding the max
        nr_of_siblings = random.randint(0, max_siblings - sibling_counts[student_id])
        possible_siblings = [i for i in range(1, nr_of_students + 1) if i != student_id and sibling_counts[i] < max_siblings]

        for sibling in range(nr_of_siblings):
            if possible_siblings:
                sibling_id = random.choice(possible_siblings)
                # Add bidirectional relations
                sibling_relations.append((student_id, sibling_id))
                sibling_relations.append((sibling_id, student_id))
                # Update counts
                sibling_counts[student_id] += 1
                sibling_counts[sibling_id] += 1
                # If the sibling has now reached the max, remove them from the pool of possible siblings
                if sibling_counts[sibling_id] == max_siblings:
                    possible_siblings.remove(sibling_id)

    return sibling_relations

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
    file.write(f"-- {nr_of_students} students\n")
    for student in students:
        file.write(f" {student},\n")
    file.write(f"-- {nr_of_contacts} contacts\n")
    for contact in contacts:
        file.write(f"{contact},\n")
    file.write(f"-- {nr_of_instructors} instructors\n")
    for instructor in instructors:
        file.write(f"{instructor},\n")
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    file.write("-- Insert " + str(nr_of_students) + " students (person IDs 1-" + str(nr_of_students) + ")\n")
    file.write(" INSERT INTO student (person_id)\n")
    file.write(" SELECT id FROM person WHERE id BETWEEN 1 AND " + str(nr_of_students) + ";\n\n")

    contact_id = nr_of_students + 1
    file.write("-- Insert " + str(nr_of_contacts) + " contact persons with random relations\n")
    file.write("INSERT INTO contact_person (relation, person_id)\n")
    file.write("VALUES\n")
    for contact in contacts:
        relation = random.choice(relations)
        file.write(f" ('{relation}', {contact_id}),\n")
        contact_id += 1
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    instructor_id = nr_of_students + nr_of_contacts + 1
    file.write("-- Insert " + str(nr_of_instructors) + " instructors (person IDs " + str(instructor_id) + "-" + str(instructor_id + nr_of_instructors) + ")\n")
    file.write("INSERT INTO instructor (teaches_ensembles, person_id)\n")
    file.write("VALUES\n")
    for instructor in instructors:
        file.write(f"  ({bool(random.getrandbits(1))}, {instructor_id}),\n")
        instructor_id += 1
    file.seek(file.tell() - 3, 0)  # Overwrite the last comma
    file.write(";\n\n")

    sibling_relations = create_sibling_relations(nr_of_students, max_siblings)
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
            date = random_date(year_range)
            start_time = random_time()
            duration = random.choice(lesson_durations)

            if lesson_type in ['Group', 'Ensemble']:
                attendees = random.randint(3, 25)  # Generate number of attendees
                min_attendees = random.randint(3, attendees)
                max_attendees = random.randint(attendees, 25)
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
            instructor_id = get_instructor_id(lesson_type, None if lesson_type == 'ensemble' else random.choice(instrument_ids))
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