import sys
import pandas as pd
from sqlalchemy import create_engine
import urllib.parse

# --- Database Credentials (FILL THIS IN) ---
# Since this runs ON iLab, 'host' is usually the specific postgres machine
DB_USER = "my463"       # Your DB username
DB_PASS = ""   # Your DB password
DB_HOST = "postgres.cs.rutgers.edu"
DB_NAME = "my463"       # Your DB name

def get_connection():
    safe_password = urllib.parse.quote_plus(DB_PASS)
    safe_user = urllib.parse.quote_plus(DB_USER)
    return create_engine(f"postgresql+psycopg2://{safe_user}:{safe_password}@{DB_HOST}/{DB_NAME}")

def run_query(query):
    try:
        engine = get_connection()
        # pandas read_sql is great for formatting tables automatically
        df = pd.read_sql(query, engine)
        
        if df.empty:
            print("Query returned no results.")
        else:
            print(df.to_string(index=False))
            
    except Exception as e:
        print(f"Database Error: {e}")

if __name__ == "__main__":
    # Check if a query was passed as an argument
    if len(sys.argv) > 1:
        query = sys.argv[1]
        run_query(query)
    else:
        # Extra Credit Stub: Read from stdin if no arg provided
        # query = sys.stdin.read()
        print("Please provide a SQL query as an argument.")