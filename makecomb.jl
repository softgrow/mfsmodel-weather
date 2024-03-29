# If a library is not found use Pkg.add("Datetime") from the Julia command line to add
# to the libraries available on this machine.
# The very first time you will get Unable to read directory METADATA
# so set the directory ENV["JULIA_PKGDIR"] = "c:/Users/simag001/.julia"
# then Pkg.Init()
# Use the Datetime library for date and time manipulations
# This is deprecated, should be using Dates and Julia 0.3
# Check version using versioninfo()
using Dates
using DataArrays, DataFrames
using GLM

include("temp_func.jl")

function predict_with_offset(temp_offset::Float64,min_month::Int,max_month::Int,airport_code::ASCIIString)
# Run through the whole five years and calculate the (1-prob0) value, ie expected value
currdate=DateTime(2009,5,1,0,0,0,0)
expected=0.0
while currdate < DateTime(2014,5,1,0,0,0,0)
  if (month(currdate)>=min_month && month(currdate)<=max_month)
  # for reach currdate calculate the expected value
  beta=coef(MNL)[1]
  beta+=coef(MNL)[2]*(year(currdate)-2005)
  # Handle the hour curve
  hourfrac=hour(currdate)+minute(currdate)/60
  beta+=coef(MNL)[3]*(min(1-0,max(0,hourfrac-0)))
  beta+=coef(MNL)[4]*(min(2-1,max(0,hourfrac-1)))
  beta+=coef(MNL)[5]*(min(4-3,max(0,hourfrac-3)))
  beta+=coef(MNL)[6]*(min(5-4,max(0,hourfrac-4)))
  beta+=coef(MNL)[7]*(min(6-5,max(0,hourfrac-5)))
  beta+=coef(MNL)[8]*(min(7-6,max(0,hourfrac-6)))
  beta+=coef(MNL)[9]*(min(8-7,max(0,hourfrac-7)))
  beta+=coef(MNL)[10]*(min(9-8,max(0,hourfrac-8)))
  beta+=coef(MNL)[11]*(min(10-9,max(0,hourfrac-9)))
  beta+=coef(MNL)[12]*(min(11-10,max(0,hourfrac-10)))
  beta+=coef(MNL)[13]*(min(12-11,max(0,hourfrac-11)))
  beta+=coef(MNL)[14]*(min(13-12,max(0,hourfrac-12)))
  beta+=coef(MNL)[15]*(min(16-15,max(0,hourfrac-15)))
  beta+=coef(MNL)[16]*(min(17-16,max(0,hourfrac-16)))
  beta+=coef(MNL)[17]*(min(18-17,max(0,hourfrac-17)))
  beta+=coef(MNL)[18]*(min(19-18,max(0,hourfrac-18)))
  beta+=coef(MNL)[19]*(min(20-19,max(0,hourfrac-19)))
  beta+=coef(MNL)[20]*(min(21-20,max(0,hourfrac-20)))
  beta+=coef(MNL)[21]*(min(22-21,max(0,hourfrac-21)))
  beta+=coef(MNL)[22]*(min(23-22,max(0,hourfrac-22)))
  beta+=coef(MNL)[23]*(min(24-23,max(0,hourfrac-23)))
  # section for Date variables
  if dayofweek(currdate)==Dates.Monday
    beta+=coef(MNL)[24]
  end
  if dayofweek(currdate)==Dates.Tuesday
    beta+=coef(MNL)[25]
  end
  if dayofweek(currdate)==Dates.Wednesday
    beta+=coef(MNL)[26]
  end
  if dayofweek(currdate)==Dates.Thursday
    beta+=coef(MNL)[27]
  end
  if dayofweek(currdate)==Dates.Friday
    beta+=coef(MNL)[28]
  end
  if dayofweek(currdate)==Dates.Saturday
    beta+=coef(MNL)[29]
  end
  # temperature section
  if airport_code=="ADL"
    currtemp=temp_offset+get_adelaide_temp(currdate)
  else
    currtemp=temp_offset+get_tokyo_temp(currdate)
  end
  beta+=coef(MNL)[30]*min(15-12,max(0,currtemp-12))
  beta+=coef(MNL)[31]*min(18-15,max(0,currtemp-15))
  beta+=coef(MNL)[32]*min(22-18,max(0,currtemp-18))
  beta+=coef(MNL)[33]*min(28-25,max(0,currtemp-25))
  beta+=coef(MNL)[34]*min(31-28,max(0,currtemp-28))
  beta+=coef(MNL)[35]*min(37-34,max(0,currtemp-34))
  beta+=coef(MNL)[36]*min(40-37,max(0,currtemp-37))
  # dew point
  if airport_code=="ADL"
    beta+=coef(MNL)[37]*get_adelaide_dewp(currdate)
  else
    beta+=coef(MNL)[37]*get_tokyo_dewp(currdate)
  end 
  # wind speed
  if airport_code=="ADL"
    beta+=coef(MNL)[38]*get_adelaide_wind_speed(currdate)
  else
    beta+=coef(MNL)[38]*get_tokyo_wind_speed(currdate)
  end
  # for Poisson distribution we expected value is equal to lambda
  expected+=exp(beta)
  end
  currdate=currdate+Dates.Minute(1)
  end
  return expected
end

source_file="mfs.csv"
# Make sure we can read our data file
if (!isfile(source_file))
   # We need to fetch the file
   download("http://data.sa.gov.au/storage/f/2014-06-26T05%3A25%3A56.821Z/samfs-data-may-01-2009-to-30-apr-2014.csv", source_file)
   if (!isfile(source_file))
      error("Tried to download $source_file and that didn't work, giving up")
   end
end

# Read in the file 
d2=readlines(open(source_file));
# Create a dictionary to hold all incident times
calllog=Dict{DateTime,Int}()
# Iterate through the file loading each elem
incidents_loaded=0
for thiselem in d2[2:end]
 eachelem=split(chomp(thiselem),',',4)
 if eachelem[4]!="MUTUAL AID GIVEN/CHANGE OF QUARTERS"
   thisdate=DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0)
    if ! haskey(calllog, thisdate)
      calllog[thisdate]=1
    else
      calllog[thisdate]+=1
    end
   incidents_loaded+=1
  end
 end
 # Iterate through each time loading a fire or not
thisdate=DateTime(2009,5,1,0,0,0,0)
zeroskipped=0
linesprinted=0
FireVec=Int[]
DateVec=DateTime[]
TempVec=Float64[]
DewpVec=Float64[]
WindSpeedVec=Float64[]
while thisdate < DateTime(2014,5,1,0,0,0,0)
  zeroskipped=zeroskipped+1
  # 12 15 18 22
  current_temp=get_adelaide_temp(thisdate)
  current_dewp=get_adelaide_dewp(thisdate)
  current_wind_speed=get_adelaide_wind_speed(thisdate)
  if (haskey(calllog,thisdate))
    if linesprinted < 1
      # use the number of incidents in this time slot
      push!(FireVec,calllog[thisdate])
      push!(DateVec,thisdate)
      push!(TempVec,current_temp)
      push!(DewpVec,current_dewp)
      push!(WindSpeedVec, current_wind_speed)
      linesprinted=linesprinted+1
    end
   end
  if zeroskipped >=1
    if linesprinted < 1
        push!(FireVec,0)
        push!(DateVec,thisdate)
        push!(TempVec,current_temp)
        push!(DewpVec,current_dewp)
        push!(WindSpeedVec, current_wind_speed)
      end
      zeroskipped=0
      linesprinted=0
    end
 thisdate=thisdate+Dates.Minute(1)
end
df= DataFrame()
df[:Fire]=FireVec
df[:Incdate]=DateVec
df[:dayofweek]=dayofweek(DateVec)
df[:year]=year(DateVec)-2005
df[:hour]=hour(DateVec)
hourfrac=hour(DateVec)+minute(DateVec)/60
df[:hourfrac]=hourfrac
df[:hourfrac2]=hourfrac.^2
df[:hourfrac3]=hourfrac.^3
df[:hourfrac4]=hourfrac.^4
df[:hourfrac5]=hourfrac.^5
df[:hourfrac6]=hourfrac.^6
df[:hourfrac7]=hourfrac.^7
df[:hourfrac8]=hourfrac.^8
df[:hourfrac9]=hourfrac.^9
df[:hourfrac10]=hourfrac.^10
df[:hourfrac11]=hourfrac.^11
df[:hour0to1]=min(1-0,max(0,hourfrac-0))
df[:hour1to2]=min(2-1,max(0,hourfrac-1))
df[:hour2to3]=min(3-2,max(0,hourfrac-2))
df[:hour3to4]=min(4-3,max(0,hourfrac-3))
df[:hour4to5]=min(5-4,max(0,hourfrac-4))
df[:hour5to6]=min(6-5,max(0,hourfrac-5))
df[:hour6to7]=min(7-6,max(0,hourfrac-6))
df[:hour7to8]=min(8-7,max(0,hourfrac-7))
df[:hour8to9]=min(9-8,max(0,hourfrac-8))
df[:hour9to10]=min(10-9,max(0,hourfrac-9))
df[:hour10to11]=min(11-10,max(0,hourfrac-10))
df[:hour11to12]=min(12-11,max(0,hourfrac-11))
df[:hour11to13]=min(13-11,max(0,hourfrac-11))
df[:hour12to13]=min(13-12,max(0,hourfrac-12))
df[:hour13to14]=min(14-13,max(0,hourfrac-13))
df[:hour14to15]=min(15-14,max(0,hourfrac-14))
df[:hour15to16]=min(16-15,max(0,hourfrac-15))
df[:hour16to17]=min(17-16,max(0,hourfrac-16))
df[:hour17to18]=min(18-17,max(0,hourfrac-17))
df[:hour18to19]=min(19-18,max(0,hourfrac-18))
df[:hour19to20]=min(20-19,max(0,hourfrac-19))
df[:hour20to21]=min(21-20,max(0,hourfrac-20))
df[:hour21to22]=min(22-21,max(0,hourfrac-21))
df[:hour22to23]=min(23-22,max(0,hourfrac-22))
df[:hour23to24]=min(24-23,max(0,hourfrac-23))
df[:month]=month(DateVec)
df[:temperature]=TempVec
df[:temp2]=TempVec.^2
df[:temp3]=TempVec.^3
df[:temp4]=TempVec.^4
df[:temp5]=TempVec.^5
df[:temp6]=TempVec.^6
df[:temp7]=TempVec.^7
df[:temp8]=TempVec.^8
df[:temp9]=TempVec.^9
df[:temp10]=TempVec.^10
df[:IsMonday]=0+(df[:dayofweek].==1)
df[:IsTuesday]=0+(df[:dayofweek].==2)
df[:IsWednesday]=0+(df[:dayofweek].==3)
df[:IsThursday]=0+(df[:dayofweek].==4)
df[:IsFriday]=0+(df[:dayofweek].==5)
df[:IsSaturday]=0+(df[:dayofweek].==6)
df[:IsSunday]=0+(df[:dayofweek].==7)
df[:tempband1]=max(0,12-TempVec)
df[:tempband2]=min(15-12,max(0,TempVec-12))
df[:tempband3]=min(18-15,max(0,TempVec-15))
df[:tempband4]=min(22-18,max(0,TempVec-18))
df[:tempband5a]=min(25-22,max(0,TempVec-22))
df[:tempband5b1]=min(28-25,max(0,TempVec-25))
df[:tempband5b2]=min(31-28,max(0,TempVec-28))
df[:tempband5b3]=min(34-31,max(0,TempVec-31))
df[:tempband5b4]=min(37-34,max(0,TempVec-34))
df[:tempband5b5]=min(40-37,max(0,TempVec-37))
df[:tempband5bz]=min(100-40,max(0,TempVec-40))
df[:dew_point]=DewpVec
df[:dew_point2]=DewpVec.^2
df[:relative_humidity]=100-5(TempVec-DewpVec)
df[:wind_speed]=WindSpeedVec
df[:wind_speed2]=WindSpeedVec.^2
# writetable("comb.csv",df)
# We know we are finished and how many incidents there were
println("$incidents_loaded incidents loaded")
MNL= glm(Fire ~ year + hourfrac+hourfrac2+hourfrac3+hourfrac4+hourfrac5+hourfrac6+hourfrac7+hourfrac8+hourfrac9 +hourfrac10+ IsMonday + IsTuesday + IsWednesday+ IsThursday + IsFriday + IsSaturday +temperature+temp2+temp3+temp4+temp5+temp6 +dew_point+dew_point2+wind_speed+wind_speed2 , df, Poisson())
# Now go through and predict manually to extract the expected number of fires with a change in temperature
#println("Expected Value for 0 ", predict_with_offset(0.0,1,12,"ADL"))
#println("Expected Value for 1 ", predict_with_offset(1.0,1,12,"ADL"))
#println("Expected Value for 2 ", predict_with_offset(2.0,1,12,"ADL"))
#println("Expected Value for -1 ", predict_with_offset(-1.0,1,12,"ADL"))
#println("Expected Value for 0 ", predict_with_offset(0.0,1,12,"HND"))
#println("Expected Value for 1 ", predict_with_offset(1.0,1,12,"HND"))
#println("Expected Value for 2 ", predict_with_offset(2.0,1,12,"HND"))
#println("Expected Value for -1 ", predict_with_offset(-1.0,1,12,"HND"))
