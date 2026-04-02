import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'bone_predict'
}

try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    
    print("\n--- Predictions Table ---")
    cursor.execute("SELECT * FROM predictions")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
        
    cursor.close()
    conn.close()
except Exception as e:
    print(f"ERROR: {e}")
