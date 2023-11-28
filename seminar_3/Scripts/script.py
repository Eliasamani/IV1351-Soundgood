from faker import Faker

nr_of_students = 100;
nr_of_contacts = 100;
nr_of_instructors = 20;

# Set the locale to Swedish
fake = Faker('sv_SE')

def create_younger():
    first_name = fake.first_name()
    last_name = fake.last_name()
    personal_number = fake.ssn(min_age=18, max_age=30, long=False, dash=True)
    phone = fake.phone_number()
    email = first_name.lower() + "." + last_name.lower() + "@" + fake.free_email_domain()
    address = fake.street_address()
    city = fake.city()
    zip_code = fake.postcode()
    return (first_name, last_name, personal_number, phone, email, address, city, zip_code)

def create_older():
    first_name = fake.first_name()
    last_name = fake.last_name()
    personal_number = fake.ssn(min_age=30, max_age=60, long=False, dash=True)
    phone = fake.phone_number()
    email = first_name.lower() + "." + last_name.lower() + "@" + fake.free_email_domain()
    address = fake.street_address()
    city = fake.city()
    zip_code = fake.postcode()
    return (first_name, last_name, personal_number, phone, email, address, city, zip_code)

students = [create_younger() for _ in range(nr_of_students)]
contacts = [create_older() for _ in range(nr_of_contacts)]
instructors = [create_older() for _ in range(nr_of_instructors)]

with open('script_data.txt', 'w', encoding='utf-8') as file:
    file.write("INSERT INTO person (first_name, last_name, personal_number, phone_number, email_address, street, city, zip)\n")
    file.write("VALUES\n")
    file.write("  -- " + str(nr_of_students) + " students\n")
    for student in students:
        file.write(str(student) + ",\n")
    file.write("  -- " + str(nr_of_contacts) + " contacts\n")
    for contacts in contacts:
        file.write(str(contacts) + ",\n")
    file.write(  "  -- " + str(nr_of_instructors) + " instructors\n")
    for i, instructor in enumerate(instructors):
        if i == len(instructors) - 1:  # Check if it's the last instructor
            file.write(str(instructor) + ";")
        else:
            file.write(str(instructor) + ",\n")

    file.write("INSERT INTO person (first_name, last_name, personal_number, phone_number, email_address, street, city, zip)\n")