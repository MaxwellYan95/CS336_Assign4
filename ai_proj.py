import urllib.parse

""" Formatting Connection String """

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

print(connection_string)
# Output will look like: postgresql+psycopg2://my_user:super%40secure%2Fpassword%21@localhost:5432/my_database