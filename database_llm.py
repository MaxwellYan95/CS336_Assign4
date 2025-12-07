import sys
import paramiko
import getpass
from llama_cpp import Llama
from huggingface_hub import hf_hub_download

# --- Configuration ---
ILAB_HOST = "ilab1.cs.rutgers.edu"  # Or your specific machine like 'java.cs.rutgers.edu'
REMOTE_SCRIPT_PATH = "/common/home/my463/cs336_Data/project3/ilab_script.py" # Where you put file #2 on iLab
DATABASE_FILE = "Database.sql"        # File #3
FEED_FILE = "FeedValues.sql"        # File #4

# --- 1. Model Setup (Adapted from your ai_proj.py) ---
model_name = "Qwen/Qwen2.5-3B-Instruct-GGUF"
model_file = "qwen2.5-3b-instruct-q4_k_m.gguf"

print(f"Downloading/Loading {model_file}...")
model_path = hf_hub_download(repo_id=model_name, filename=model_file)

llm = Llama(
    model_path=model_path,
    n_ctx=4096,
    n_gpu_layers=-1, 
    verbose=False
)

# --- 2. Load Context for the AI ---
def get_schema_context():
    schema = ""
    try:
        with open(DATABASE_FILE, 'r') as f:
            schema += (f.read() + "")
    except FileNotFoundError:
        print(f"Error: Could not find {DATABASE_FILE}. Make sure it exists locally.")
        sys.exit(1)
    try:
        with open(FEED_FILE, 'r') as f:
            schema += (f.read() + "")
    except FileNotFoundError:
        print(f"Error: Could not find {FEED_FILE}. Make sure it exists locally.")
        sys.exit(1)
    return schema

schema_context = get_schema_context()
print(f"schema: {schema_context}")

# --- 3. Generate SQL ---
def generate_sql(question):
    # Updated prompt with stricter constraints
    system_prompt = (
        "You are a strict SQL assistant. Convert the user's question into a valid SQL query "
        "based ONLY on the provided schema below.\n"
        "RULES:\n"
        "1. Use ONLY the table names and columns explicitly defined in the Schema.\n"
        "2. Do NOT invent table names (like 'some_table') or column names.\n"
        "3. Output ONLY the SQL query. No markdown formatting, no explanations."
    )
    
    full_prompt = f"""<|im_start|>system
{system_prompt}<|im_end|>
<|im_start|>user
Schema:
{schema_context}

Question: {question}<|im_end|>
<|im_start|>assistant
"""
    
    output = llm(
        full_prompt,
        max_tokens=400, # Increased slightly to prevent cutoff on joins
        stop=["<|im_end|>", ";"], 
        echo=False
    )
    
    response_text = output['choices'][0]['text'].strip()
    cleaned_sql = response_text.replace("```sql", "").replace("```", "").strip()
    return cleaned_sql

# --- 4. SSH Execution ---
def execute_on_ilab(sql_query, username, password):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ILAB_HOST, username=username, password=password)
        
        # Escape quotes for the command line to prevent syntax errors
        safe_query = sql_query.replace('"', '\\"')
        
        # Path to the activate script
        env_activate_path = "/common/home/my463/cs336_Data/project3/ai_env/bin/activate"

        # COMBINE the commands with '&&' so they run in the SAME session
        # We use 'bash -c' to ensure 'source' works as expected if the default shell varies
        full_command = f'source {env_activate_path} && python3 {REMOTE_SCRIPT_PATH} "{safe_query}"'
        
        # Executing just once
        print(f"Sending command to {ILAB_HOST}...")
        stdin, stdout, stderr = ssh.exec_command(full_command)
        
        # Capture output
        result = stdout.read().decode()
        error = stderr.read().decode()
        
        if error:
            # Note: Pandas sometimes prints warnings to stderr, which aren't fatal errors.
            print(f"\n[Remote Stderr]: {error}")
            
        if result:
            print(f"\n[Remote Output]:\n{result}")
        else:
            print("\n[Remote Output]: <No output returned>")
        
        ssh.close()
    except Exception as e:
        print(f"SSH Connection Failed: {e}")

# --- 5. Main Loop ---
if __name__ == "__main__":
    print("--- Database LLM Client ---")
    user = input("Enter iLab Username: ")
    pwd = getpass.getpass("Enter iLab Password: ")

    while True:
        q = input("\nEnter your question (or 'exit'): ")
        if q.strip().lower() == "exit":
            break
            
        print("Generating SQL...")
        sql = generate_sql(q)
        print(f"Generated SQL: {sql}")
        
        print(f"Executing on {ILAB_HOST}...")
        execute_on_ilab(sql, user, pwd)