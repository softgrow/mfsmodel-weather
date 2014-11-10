# If a library is not found use Pkg.add("Datetime") from the Julia command line to add
# to the libraries available on this machine.
# The very first time you will get Unable to read directory METADATA
# so set the directory ENV["JULIA_PKGDIR"] = "c:/Users/simag001/.julia"
# then Pkg.Init()
# Use the Datetime library for date and time manipulations
# This is deprecated, should be using Dates and Julia 0.3
# Check version using versioninfo()
using Dates

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
for thiselem in d2[2:end]
 eachelem=split(chomp(thiselem),',',4)
 # should check for collisions
 calllog[DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0)]=Incident(int(eachelem[1]),DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0),eachelem[3],eachelem[4])
 end
outfil=open("comb.csv","w")
# print a header
println(outfil,"Fire,Incdate,dayofweek,hour,month,temperature,IsMonday,IsTuesday,IsWednesday,IsThursday,IsFriday,IsSaturday,IsSunday,IsMonday");
 # Iterate through each time loading a fire or not
thisdate=DateTime(2009,5,1,0,0,0,0)
zeroskipped=0
linesprinted=0
while thisdate < DateTime(2014,5,1,0,0,0,0)
  zeroskipped=zeroskipped+1
  if (haskey(calllog,thisdate))
    if linesprinted < 1
      print(outfil,"1")
      println(outfil,",\"",thisdate,"\",",dayofweek(thisdate),',',hour(thisdate),',',month(thisdate),',',get_adelaide_temp(thisdate),',',dayofweek(thisdate)==1?1:0,',',dayofweek(thisdate)==2?1:0,',',dayofweek(thisdate)==3?1:0,',',dayofweek(thisdate)==4?1:0,',',dayofweek(thisdate)==5?1:0,',',dayofweek(thisdate)==6?1:0,',',dayofweek(thisdate)==7?1:0)
      linesprinted=linesprinted+1
    end
   end
  if zeroskipped >=60
    if linesprinted < 1
        print(outfil,"0")
        println(outfil,",\"",thisdate,"\",",dayofweek(thisdate),',',hour(thisdate),',',month(thisdate),',',get_adelaide_temp(thisdate),',',dayofweek(thisdate)==1?1:0,',',dayofweek(thisdate)==2?1:0,',',dayofweek(thisdate)==3?1:0,',',dayofweek(thisdate)==4?1:0,',',dayofweek(thisdate)==5?1:0,',',dayofweek(thisdate)==6?1:0,',',dayofweek(thisdate)==7?1:0)
      end
      zeroskipped=0
      linesprinted=0
    end
 thisdate=thisdate+Dates.Minute(1)
end
close(outfil)
