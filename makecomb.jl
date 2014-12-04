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
# Create a dictionary to hold all of the incidents
type Incident
 idnum::Int
 idate::DateTime
 istation::ASCIIString
 icalltype::ASCIIString
end
calllog=Dict{DateTime,Incident}()
# Iterate through the file loading each elem
incidents_loaded=0
for thiselem in d2[2:end]
 eachelem=split(chomp(thiselem),',',4)
 if eachelem[4]!="MUTUAL AID GIVEN/CHANGE OF QUARTERS"
   # should check for collisions
   incidents_loaded+=1
   calllog[DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0)]=Incident(int(eachelem[1]),DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0),eachelem[3],eachelem[4])
   end
 end
 # Iterate through each time loading a fire or not
thisdate=DateTime(2009,5,1,0,0,0,0)
zeroskipped=0
linesprinted=0
FireVec=Int[]
DateVec=DateTime[]
TempVec=Float64[]
while thisdate < DateTime(2014,5,1,0,0,0,0)
  zeroskipped=zeroskipped+1
  # 12 15 18 22
  current_temp=get_adelaide_temp(thisdate)
  if (haskey(calllog,thisdate))
    if linesprinted < 1
      push!(FireVec,1)
      push!(DateVec,thisdate)
      push!(TempVec,current_temp)
      linesprinted=linesprinted+1
    end
   end
  if zeroskipped >=10
    if linesprinted < 1
        push!(FireVec,0)
        push!(DateVec,thisdate)
        push!(TempVec,current_temp)
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
df[:hour]=hour(DateVec)
df[:month]=month(DateVec)
df[:temperature]=TempVec
df[:IsMonday]=0+(df[:dayofweek].==1)
df[:IsTuesday]=0+(df[:dayofweek].==2)
df[:IsWenesday]=0+(df[:dayofweek].==3)
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
df[:tempband5bz]=max(0,TempVec-40)
# writetable("comb.csv",df)
# We know we are finished and how many incidents there were
println("$incidents_loaded incidents loaded")
MNL= glm(Fire ~ hour + temperature + IsMonday + IsThursday + IsFriday + IsSaturday, df,Binomial(),LogitLink())

