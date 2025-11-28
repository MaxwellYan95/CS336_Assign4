import urllib.parse
import pandas as pd
from sqlalchemy import create_engine, inspect

""" Formatting Connection String and Creating Engine """
def getConnection() -> str:
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
    return f"postgresql+psycopg2://{safe_user}:{safe_password}@{host}:{port}/{dbname}"



""" Extracting Schema """
def getSchema(engine) -> str:
    # Create an inspector
    inspector = inspect(engine)

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
    return schema[:len(schema)-2]



""" User Input """
def query(engine) -> str:
    # Write your query
    query = "SELECT * FROM applicant_race LIMIT 100;"

    try:
        # Extract data directly into a DataFrame
        # Using 'with' ensures the connection closes automatically
        with engine.connect() as connection:
            df = pd.read_sql(query, connection)

        # Display the table
        return df.head()
    except Exception as e:
        return f"Error connecting to Postgres: {e}"

def main():
    # Get connection string
    connect = getConnection()
    print(f"Connection String: {connect}")

    # Create the connection engine
    engine = create_engine(connect)

    # Get schema name
    schema = getSchema(engine)
    print(f"Schema String: {schema}")

    # Get query
    queryStr = query(engine)
    print(f"Query String\n: {queryStr}")



if __name__ == "__main__":
    main()