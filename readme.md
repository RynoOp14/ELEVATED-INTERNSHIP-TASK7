 Task 7 – Basic Sales Summary from MySQL Database using Python

📌 Overview
This task demonstrates how to:
- Create a MySQL database and table
- Insert sales data
- Run SQL queries inside Python (Jupyter Notebook)
- Display the results in a Pandas DataFrame
- Visualize sales revenue using a Matplotlib bar chart

---

 🗂 Files in this Repository
- sqlqueries.sql → SQL script to create the database, table, and insert sample sales data.
- task7.ipynb → Jupyter Notebook that connects to MySQL, runs queries, and plots the sales chart.
- sales_chart.png → Bar chart showing revenue per product.
- README.md → Documentation file (this file).



 🛠 Tools & Libraries Used
- MySQL Workbench → For creating the database and running initial SQL commands.
- Python Libraries:
  - `mysql-connector-python` → Connects Python to MySQL.
  - `pandas` → Loads query results into a DataFrame.
  - `matplotlib` → Creates the sales bar chart.

---

⚙ Step-by-Step Process

1️⃣ Create Database and Table in MySQL Workbench
Run the following SQL queries in **MySQL Workbench** (`sqlqueries.sql`):

```sql
-- Create database
CREATE DATABASE sales_db;

-- Select database
USE sales_db;

-- Create sales table
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO sales (product, quantity, price) VALUES
('Laptop', 3, 50000),
('Mouse', 10, 500),
('Keyboard', 5, 1500),
('Monitor', 2, 12000),
('Laptop', 1, 50000),
('Mouse', 5, 500);

2️⃣ Install Required Libraries in Jupyter Notebook

In your task7.ipynb, install dependencies:

!pip install mysql-connector-python pandas matplotlib

3️⃣ Connect to MySQL from Jupyter Notebook
import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",       
    user="root",            
    password="yourpassword",
    database="sales_db"
)

4️⃣ Run the SQL Query inside Python
query = """
SELECT product,
       SUM(quantity) AS total_qty,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
"""

df = pd.read_sql(query, conn)
print(df)

5️⃣ Plot Sales Revenue Chart
df.plot(kind="bar", x="product", y="revenue", legend=False)
plt.ylabel("Revenue (₹)")
plt.title("Sales Revenue per Product")
plt.tight_layout()
plt.savefig("sales_chart.png")
plt.show()

6️⃣ Close the Connection
conn.close()

📊 Example Output Table
product	total_qty	revenue
Laptop	4	200000.00
Mouse	15	7500.00
Keyboard	5	7500.00
Monitor	2	24000.00
