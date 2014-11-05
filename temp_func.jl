function get_adelaide_temp(current_time)
  if (!haskey(got_temp_year, year(current_time)))
    # we don't have this year loaded
    # Open the file, if we cant give up
    wanted_site="946720"
    wanted_year=string(year(current_time))
    wanted_file="$wanted_site-99999-$wanted_year.gz"
    if (!isfile(wanted_file))
       # We need to fetch the file
       download("ftp://ftp.ncdc.noaa.gov/pub/data/noaa/isd-lite/$wanted_year/$wanted_file", wanted_file)
       if (!isfile(wanted_file))
          error("Tried to download $source_file and that didn't work, giving up")
       end
    end
    # File is gzipped, open inside a pipe
    dt=readlines(`c:\\cygwin64\\bin\\gzip -cd $wanted_file`)
    # The file is in a fixed format
    # 2009 01 01 01   204    88 10127   220    87 -9999 -9999 -9999\n
    for thiselem in dt
      push!(adelaide_temp_obs,met_obs(DateTime(int(thiselem[1:4]),int(thiselem[6:7]),int(thiselem[9:10]),int(thiselem[12:13]),0,0,0),int(thiselem[14:19])/10))
    end
    # Read in the data without altering the offset??
    sort!(adelaide_temp_obs)
    got_temp_year[year(current_time)]=true
  end
  if (!haskey(got_temp_year, year(current_time)))
    exit("Something gone badly wrong"+year(current_time))
  end
  # find the time immediately before the current time and return the adelaide airport observation
  # Dont forget to subtract 9.5 hours for UTC in the observations fro NASA
  return adelaide_temp_obs[searchsortedlast(adelaide_temp_obs,current_time-Dates.Hour(9)-Dates.Minute(30))].mtemp
  # For the moment, just return the average max temperature for the month
  # average_mean_max=[28.1,28.1,25.5,22.2,18.6,15.9,14.9,15.9,18.2,21.0,23.9,25.7]
  #  return average_mean_max[month(current_time)]
end

got_temp_year=Dict{Int,Bool}()

type met_obs
 mdate::DateTime
 mtemp::Float64
end
Base.isless(x::met_obs,y::met_obs) = isless(x.mdate,y.mdate) # this is how we sort them
Base.isless(x::DateTime,y::met_obs) = isless(x,y.mdate) # make searchsorted and friends work
adelaide_temp_obs=met_obs[]
