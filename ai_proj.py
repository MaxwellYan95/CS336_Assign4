import urllib.parse
import pandas as pd
from sqlalchemy import create_engine, inspect

""" Formatting Connection String and Creating Engine """

# Your raw info
user = "postgres"
password = "CattieMcWorm" # The '@' and '/' would break a normal string
host = "localhost"
port = "5432"
dbname = "postgres"

# Encode the password (and user, just to be safe)
safe_password = urllib.parse.quote_plus(password)
safe_user = urllib.parse.quote_plus(user)

# Construct the string
connection_string = f"postgresql+psycopg2://{safe_user}:{safe_password}@{host}:{port}/{dbname}"
print(connection_string) # Output will look like: postgresql+psycopg2://my_user:super%40secure%2Fpassword%21@localhost:5432/my_database

# Create the connection engine
engine = create_engine(connection_string)



""" Extracting Schema """

# Create an inspector
inspector = inspect(engine)

# Print Schema
print(inspector.get_schema_names())

# Get Table Names
table_names = inspector.get_table_names()

# Stores Schema
schema = ""

# Format Schema String
for table in table_names:
    schema += (str(table) + "(")
    # Goes through columns
    col_str = ""
    for col in inspector.get_columns(table):
        col_str += (str(col['name']) + ", ")
    schema += (col_str[:len(col_str)-2] + "), ")
schema = schema[:len(schema)-2]
print(schema)



""" User Input """

# Write your query
query = "SELECT * FROM applicant_race LIMIT 100;"

try:
    # Extract data directly into a DataFrame
    # Using 'with' ensures the connection closes automatically
    with engine.connect() as connection:
        df = pd.read_sql(query, connection)

    # Display the table
    print(df.head())

except Exception as e:
    print(f"Error connecting to Postgres: {e}")

"""
while True:
    # 3. Write your query
    query = "SELECT * FROM employees LIMIT 100;"

    if query == "exit":
        break

    try:
        # 4. Extract data directly into a DataFrame
        # Using 'with' ensures the connection closes automatically
        with engine.connect() as connection:
            df = pd.read_sql(query, connection)

            # 5. Display the table
            print(df.head())

    except Exception as e:
        print(f"Error connecting to Postgres: {e}")
"""