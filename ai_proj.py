import urllib.parse
from sqlalchemy import create_engine, inspect
from llama_cpp import Llama
from huggingface_hub import hf_hub_download

# --- 1. Model Setup (Qwen 2.5-3B via Llama.cpp) ---
# We use the official GGUF repo for Qwen 2.5
model_name = "Qwen/Qwen2.5-3B-Instruct-GGUF"
model_file = "qwen2.5-3b-instruct-q4_k_m.gguf"

print(f"Downloading {model_file}...")
model_path = hf_hub_download(repo_id=model_name, filename=model_file)

# Initialize the Model
# Qwen 2.5 supports a large context window (up to 32k), 
# but 4096 or 8192 is usually sufficient for SQL schemas.
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
    
    # Qwen 2.5 Uses ChatML Format:
    # <|im_start|>system
    # ...
    # <|im_end|>
    # <|im_start|>user
    # ...
    # <|im_end|>
    # <|im_start|>assistant
    
    full_prompt = f"""<|im_start|>system
{system_prompt}<|im_end|>
<|im_start|>user
Schema:
{tables_schema}

Question: {question}<|im_end|>
<|im_start|>assistant
"""
    
    output = llm(
        full_prompt,
        max_tokens=200, 
        # Update stop tokens for Qwen
        stop=["<|im_end|>", ";"], 
        echo=False
    )
    
    return output['choices'][0]['text'].strip()

# --- 5. Execution ---
question = "Give me all loans in Mercer County"
print(f"Generating SQL for: {question}")

queryStr = generate_sql(question)
print(f"Query String:\n {queryStr};")