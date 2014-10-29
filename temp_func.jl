function get_adelaide_temp(current_time)
  if (!haskey(got_temp_year, year(current_time)))
    # we don't have this year loaded
    # Open the file, if we cant give up
    wanted_url="ftp://ftp.ncdc.noaa.gov/pub/data/noaa/isd-lite/2009/946720-99999-2009.gz"
    download(wanted_url, "946720-99999-2009.gz")
    # File is gzipped, need to decompress before reading
    run("\"C:\\Program Files (x86)\\GnuWin32\\bin\\gzip\" -d 946720-99999-2009.gz")
    # Read in the data without altering the offset??
    # if no file available give up
    # got_temp_year(current_time)=true
  end
  if (!haskey(got_temp_year, year(current_time)))
    exit("Something gone badly wrong"+year(current_time))
  end
  # find the time immediately before the current time and return the adelaide airport observation
# For the moment, just return the average max temperature for the month
  average_mean_max=[28.1,28.1,25.5,22.2,18.6,15.9,14.9,15.9,18.2,21.0,23.9,25.7]
   return average_mean_max[month(current_time)]

end

got_temp_year=Dict{Int,Bool}()
adelaide_temp_obs=Dict{DateTime,Float64}()
