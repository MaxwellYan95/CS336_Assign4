import urllib.parse
from sqlalchemy import create_engine, inspect
from llama_cpp import Llama
from huggingface_hub import hf_hub_download

# --- 1. Model Setup (Phi-3.5 via Llama.cpp) ---
model_name = "bartowski/Phi-3.5-mini-instruct-GGUF"
model_file = "Phi-3.5-mini-instruct-Q4_K_M.gguf"

print(f"Downloading {model_file}...")
model_path = hf_hub_download(repo_id=model_name, filename=model_file)

# Initialize the Model
llm = Llama(
    model_path=model_path,
    n_ctx=4096,
    n_gpu_layers=-1, 
    verbose=False
)

# --- 2. Database Connection ---
def getConnection() -> str:
    user = "my463"
    password = "" 
    host = "postgres.cs.rutgers.edu"
    port = "5432"
    dbname = "my463"

    safe_password = urllib.parse.quote_plus(password)
    safe_user = urllib.parse.quote_plus(user)

    return f"postgresql+psycopg2://{safe_user}:{safe_password}@{host}:{port}/{dbname}"

engine = create_engine(getConnection())

# --- 3. Extracting Schema (Updated Format) ---
def getSchema() -> str:
    inspector = inspect(engine)
    table_names = inspector.get_table_names()
    schema = ""

    for table in table_names:
        # Start the CREATE TABLE statement
        schema += f"CREATE TABLE {table} (\n"
        
        # Fetch columns and Primary Key constraints
        columns = inspector.get_columns(table)
        pks = inspector.get_pk_constraint(table).get('constrained_columns', [])
        
        col_definitions = []
        for col in columns:
            # Format: "column_name COLUMN_TYPE"
            col_def = f"    {col['name']} {col['type']}"
            
            # Append PRIMARY KEY if this column is a PK
            if col['name'] in pks:
                col_def += " PRIMARY KEY"
            
            col_definitions.append(col_def)
        
        # Join columns with commas and newlines
        schema += ",\n".join(col_definitions)
        schema += "\n);\n\n"
        
    return schema

# Get the formatted schema string
tables_schema = getSchema()

# --- 4. Generate SQL ---
def generate_sql(question):
    # System prompt tailored for SQL generation
    system_prompt = (
        "You are an expert SQL assistant. Convert the user's question into a valid SQL query "
        "based on the provided CREATE TABLE schema. "
        "Do not explain, just output the SQL."
    )
    
    # Phi-3.5 Prompt Structure
    full_prompt = f"""<|system|>
{system_prompt}<|end|>
<|user|>
Schema:
{tables_schema}

Question: {question}<|end|>
<|assistant|>
"""
    
    output = llm(
        full_prompt,
        max_tokens=200, 
        stop=["<|end|>", ";"], 
        echo=False
    )
    
    return output['choices'][0]['text'].strip()

# --- 5. Execution ---
question = "Give me all loans in Mercer County"
print(f"Generating SQL for: {question}")

queryStr = generate_sql(question)
print(f"Query String:\n {queryStr};")