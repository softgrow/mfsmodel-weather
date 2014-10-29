function get_adelaide_temp(current_time)
# For the moment, just return the average max temperature for the month
  average_mean_max=[28.1,28.1,25.5,22.2,18.6,15.9,14.9,15.9,18.2,21.0,23.9,25.7]
   return average_mean_max[month(current_time)]

end
