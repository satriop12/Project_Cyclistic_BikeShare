#importing data base to csv for tableau dashboard visualization

import sqlite3
import pandas as pd

# connect to the sqlite database
conn = sqlite3.connect('cyclistic_bikeshare_q1_2023_3month.db')

# define the sql query to retrieve data from your table
query = "SELECT * FROM data_bikeshare_q1_2023"

# use pandas to read the data from the sqlite table into a dataframe
df = pd.read_sql_query(query, conn)

# define the filename for your csv file
csv_filename = '2023-q1-divvy-tripdata.csv'

# export the DataFrame to a cssv file
df.to_csv(csv_filename, index=False)

# close the database connection
conn.close()

print(f'Data exported to {csv_filename}')
