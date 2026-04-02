import mysql.connector
import json

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'bone_predict'
}

def report():
    results = {"success": False, "doctors": [], "error": None}
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.execute("SELECT name, email, password FROM doctors")
        for row in cursor.fetchall():
            results["doctors"].append({"name": row[0], "email": row[1], "password": row[2]})
        results["success"] = True
        cursor.close()
        conn.close()
    except Exception as e:
        results["error"] = str(e)
    
    with open("db_report.json", "w", encoding="utf-8") as f:
        json.dump(results, f, indent=4)

if __name__ == "__main__":
    report()
