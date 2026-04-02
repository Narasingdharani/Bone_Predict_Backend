import mysql.connector

print("--- DB CHECK START ---")
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'bone_predict'
}

try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Connecting successful.")
    
    print("\nDoctors in DB:")
    cursor.execute("SELECT name, email, password FROM doctors")
    rows = cursor.fetchall()
    if not rows:
        print("No doctors found.")
    for row in rows:
        print(f"User: {row[0]}, Email: {row[1]}, Pass: {row[2]}")
    
    print("\nLatest OTPs:")
    cursor.execute("SELECT email, otp, createdAt FROM otps ORDER BY createdAt DESC LIMIT 5")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
        
    cursor.close()
    conn.close()
except Exception as e:
    print(f"ERROR: {e}")

print("--- DB CHECK END ---")
