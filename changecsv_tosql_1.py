#Merge 3 csv file and putting it into database
import sqlite3
import pandas as pd

# initialize the sqlite connection
connect = sqlite3.connect('cyclistic_bikeshare_q1_2023_3month.db')
# loop through each csv file and append data to the sqlite table
csv_files = ['202301-divvy-tripdata.csv', '202302-divvy-tripdata.csv', '202303-divvy-tripdata.csv']

for file in csv_files:
    # read data from the csv file and parse datetime columns
    df = pd.read_csv(file, parse_dates=["started_at", "ended_at"], encoding="utf-8")
    df.columns = df.columns.str.strip()
    # append the data to the sqlite table
    df.to_sql('data_bikeshare_q1_2023', connect, if_exists='append', index=False)

print("Finish!")
