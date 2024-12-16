import psycopg2
from faker import Faker
import random
from datetime import datetime, timedelta

# Configuration de la connexion
DB_NAME = "analytics"
DB_USER = "postgres"
DB_PASSWORD = "1234"
DB_HOST = "localhost"


# Connexion à PostgreSQL
def connect():
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST
        )
        print("Connexion réussie")
        return conn
    except Exception as e:
        print("Erreur de connexion :", e)
        return None


# Génération de données avec Faker
fake = Faker()


def generate_products(conn, n=3):
    with conn.cursor() as cursor:
        for _ in range(n):
            product_name = fake.word().capitalize()[:100]  # Truncate to 100 characters
            category = fake.word()[:50]                   # Truncate to 50 characters
            price = round(random.uniform(10, 1000), 2)
            cursor.execute(
                """
                INSERT INTO Products (Product, Category, Price)
                VALUES (%s, %s, %s)
                """,
                (product_name, category, price)
            )
        conn.commit()
        print(f"{n} produits insérés.")


def generate_customers(conn, n=4):
    with conn.cursor() as cursor:
        for _ in range(n):
            first_name = fake.first_name()[:50]  # Truncate to 50 characters
            last_name = fake.last_name()[:50]   # Truncate to 50 characters
            country = fake.country()[:50]      # Truncate to 50 characters
            score = random.randint(0, 100)     # Ensure score is between 0 and 100
            cursor.execute(
                """
                INSERT INTO Customers (FirstName, LastName, Country, Score)
                VALUES (%s, %s, %s, %s)
                """,
                (first_name, last_name, country, score)
            )
        conn.commit()
        print(f"{n} clients insérés.")


def generate_employees(conn, n=2):
    with conn.cursor() as cursor:
        # Fetch existing employee IDs to assign as managers
        cursor.execute("SELECT EmployeeID FROM Employees")
        existing_ids = [row[0] for row in cursor.fetchall()]

        for _ in range(n):
            first_name = fake.first_name()[:50]  # Truncate to 50 characters
            last_name = fake.last_name()[:50]   # Truncate to 50 characters
            department = random.choice(['Sales', 'HR', 'IT', 'Finance'])[:50]
            birth_date = fake.date_of_birth(minimum_age=22, maximum_age=60)
            gender = random.choice(['M', 'F'])
            salary = round(random.uniform(30000, 120000), 2)
            manager_id = random.choice(existing_ids) if existing_ids else None
            cursor.execute(
                """
                INSERT INTO Employees (FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
                """,
                (first_name, last_name, department, birth_date, gender, salary, manager_id)
            )
            # Add the new employee ID to the list of existing IDs
            cursor.execute("SELECT LASTVAL()")
            new_id = cursor.fetchone()[0]
            existing_ids.append(new_id)
        conn.commit()
        print(f"{n} employés insérés.")


def generate_orders(conn, n=10):
    with conn.cursor() as cursor:
        for _ in range(n):
            # Fetch valid ProductID, CustomerID, and SalesPersonID values
            cursor.execute("SELECT ProductID FROM Products")
            product_ids = [row[0] for row in cursor.fetchall()]

            cursor.execute("SELECT CustomerID FROM Customers")
            customer_ids = [row[0] for row in cursor.fetchall()]

            cursor.execute("SELECT EmployeeID FROM Employees")
            salesperson_ids = [row[0] for row in cursor.fetchall()]

            # Ensure there are valid IDs before creating orders
            if not product_ids or not customer_ids or not salesperson_ids:
                print("Insufficient data to generate orders.")
                return

            product_id = random.choice(product_ids)
            customer_id = random.choice(customer_ids)
            salesperson_id = random.choice(salesperson_ids)
            order_date = fake.date_this_year()
            ship_date = order_date + timedelta(days=random.randint(1, 10))
            order_status = random.choice(['Pending', 'Shipped', 'Delivered', 'Cancelled'])
            ship_address = fake.address()
            bill_address = fake.address()
            quantity = random.randint(1, 20)
            creation_time = datetime.now()
            cursor.execute(
                """
                INSERT INTO Orders (ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, CreationTime)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (product_id, customer_id, salesperson_id, order_date, ship_date, order_status, ship_address, bill_address, quantity, creation_time)
            )
        conn.commit()
        print(f"{n} commandes insérées.")


# Exemple d'utilisation
if __name__ == "__main__":
    conn = connect()
    if conn:
        generate_products(conn, n=4)
        generate_customers(conn, n=7)
        generate_employees(conn, n=2)
        generate_orders(conn, n=20)
        conn.close()