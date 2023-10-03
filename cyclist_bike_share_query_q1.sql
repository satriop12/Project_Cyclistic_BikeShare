-- Q1 2023

-- count of member type
select strftime('%m', started_at) as month, member_casual, count(ride_id) as total_riders
from data_bikeshare_q1_2023
group by 1, 2

-- stasiun yang paling banyak dikunjungi
select start_station_name, count(ride_id) as total_riders
from data_bikeshare_q1_2023
where start_station_name is not null
group by 1
order by 2 desc
limit 10

-- calculate time spent to the bike (top 10 riders) (1 - result)
select ride_id, started_at, ended_at, member_casual, start_station_name,(strftime('%s', ended_at) - strftime('%s', started_at)) / 3600 as ride_length_hours
from data_bikeshare_q1_2023
group by 1
order by 6 desc
limit 10

-- determining what day is the most busy day
select strftime('%w', started_at) as day_of_week, count(ride_id) as total_riders
from data_bikeshare_q1_2023
group by 1


-- average usage of each day (2 - result)
select strftime('%w', started_at) as day_of_week, avg((strftime('%s', ended_at) - strftime('%s', started_at)) / 60) as avg_ride_length_minutes
from data_bikeshare_q1_2023
group by 1 


-- average usage of each member type (3 - result)
select strftime('%m', started_at) as month, member_casual, avg((strftime('%s', ended_at) - strftime('%s', started_at)) / 60) as avg_ride_length_minutes
from data_bikeshare_q1_2023
group by 1, 2


-- type of bike that used
select strftime('%m', started_at) as month, rideable_type, count(ride_id) as total_riders
from data_bikeshare_q1_2023
group by 1, 2 


-- total time bike used per month (4 - result)
select strftime('%m', started_at) as month, sum((strftime('%s', ended_at) - strftime('%s', started_at)) / 3600) as total_ride_length_hours, count(ride_id) as total_riders
from data_bikeshare_q1_2023
group by 1