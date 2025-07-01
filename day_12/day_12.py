import pyodbc
import pandas as pd

driverName = 'SQL SERVER'
serverName = 'nikilesha\SQLEXPRESS'
database = 'serv'

connection_string = f"""
    DRIVER={driverName};SERVER={serverName};DATABASE={database};
    Trust_Connection = yes

"""

conn = pyodbc.connect(connection_string)

cursor = conn.cursor()


cursor.execute("insert into demo values (2,'Nick','Mumbai');")
conn.commit()

cursor.execute("select * from demo;")

rows = cursor.fetchall()


columns = [column[0] for column in cursor.description]
df = pd.DataFrame.from_records(rows,columns=columns)
print(df)

