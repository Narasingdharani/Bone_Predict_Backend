import os
import re

APP_PY_PATH = "app.py"

with open(APP_PY_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace Imports
content = content.replace("import mysql.connector", "import sqlite3")
content = re.sub(r'# MySQL Configuration.*?\}\n', '', content, flags=re.DOTALL)

# Replace DB connection
db_conn_str = '''def get_db_connection():
    db_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), "bone_backend", "users.db")
    os.makedirs(os.path.dirname(db_path), exist_ok=True)
    conn = sqlite3.connect(db_path)
    # Return rows as dict-like objects if needed, but we'll stick to tuples as original code assumed
    return conn
'''
content = re.sub(r'def get_db_connection\(\):.*?raise err\n', db_conn_str, content, flags=re.DOTALL)

# Replace Table definitions
# For SQLite, AUTO_INCREMENT is AUTOINCREMENT
content = content.replace("AUTO_INCREMENT PRIMARY KEY", "INTEGER PRIMARY KEY AUTOINCREMENT")

# Also, the 'doctors' table in MySQL has 'name', 'email', 'password'.
# The 'users' table in SQLite has exactly 'id', 'name', 'email', 'password', 'phone', 'specialty', 'institution', 'license_no'
# Let's drop creating 'doctors' and instead conditionally create 'users'
content = content.replace("CREATE TABLE IF NOT EXISTS doctors (", "CREATE TABLE IF NOT EXISTS users (")
# Let's replace 'doctors' with 'users' in queries
content = content.replace("FROM doctors", "FROM users")
content = content.replace("INTO doctors", "INTO users")
content = content.replace("UPDATE doctors", "UPDATE users")

# Replace %s with ? in executed queries.
# This requires a bit of regex for typical cursor.execute containing %s
# Find lines with cursor.execute(..., ...%s...) and replace %s with ?
# Note: Since %s might be used in logging (e.g., f"Error: {e}"), we only target cursor.execute
# A simple way: find the start of cursor.execute and replace %s with ? inside the SQL string
def replace_placeholders(match):
    sql_str = match.group(1).replace('%s', '?')
    return f'cursor.execute({sql_str}'

content = re.sub(r'cursor\.execute\((.*?)\)', replace_placeholders, content, flags=re.DOTALL)

# Replace mysql.connector.Error
content = content.replace("mysql.connector.Error", "sqlite3.Error")

# Handle BOOLEAN in sqlite3
content = content.replace("hasDiabetes BOOLEAN", "hasDiabetes INTEGER")
content = content.replace("hasHypertension BOOLEAN", "hasHypertension INTEGER")
content = content.replace("hasOsteoporosis BOOLEAN", "hasOsteoporosis INTEGER")
content = content.replace("bleedingOnProbing BOOLEAN", "bleedingOnProbing INTEGER")

# Drop the lastrowid implementation since cursor.lastrowid is standard in sqlite3 as well
# Wait, let's fix the sync_to_csv to write Users instead of Doctors if needed
content = content.replace('DOCTORS_CSV = "doctors.csv"', 'USERS_CSV = "users.csv"')
content = content.replace('DOCTORS_CSV', 'USERS_CSV')

with open(APP_PY_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

print("Migration script completed!")
