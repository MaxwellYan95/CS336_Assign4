import urllib.parse
import pandas as pd
from sqlalchemy import create_engine, inspect
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM

# Load the V2 model specifically
tokenizer = AutoTokenizer.from_pretrained("juierror/flan-t5-text2sql-with-schema-v2")
model = AutoModelForSeq2SeqLM.from_pretrained("juierror/flan-t5-text2sql-with-schema-v2")

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

# Here's the engine
engine = create_engine(getConnection())

""" Extracting Schema """
def getSchema() -> str:
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

# Get schema string
tables = getSchema()

def generate_sql(question):
    # Construct prompt
    # Strict Format: "convert tables: <tables> question: <question>"
    prompt = f"convert tables: {tables} question: {question}"
    
    # Generate
    inputs = tokenizer(prompt, return_tensors="pt")
    outputs = model.generate(**inputs, max_length=512)
    return tokenizer.decode(outputs[0], skip_special_tokens=True)

# Get query
queryStr = generate_sql("Give me all loans in Mercer County")
print(f"Query String:\n {queryStr}")