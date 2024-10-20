import mysql.connector
from mysql.connector import Error

def create_database():
        # Connect to MySQL server (no database selected initially)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Nebulacloud@2024'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
        # Ensure the connection is closed properly
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

# Run the function
if __name__ == "__main__":
    create_database()
