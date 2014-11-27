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
incidents_loaded=0
for thiselem in d2[2:end]
 eachelem=split(chomp(thiselem),',',4)
 if eachelem[4]!="MUTUAL AID GIVEN/CHANGE OF QUARTERS"
   # should check for collisions
   incidents_loaded+=1
   calllog[DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0)]=Incident(int(eachelem[1]),DateTime(int(eachelem[2][1:4]),int(eachelem[2][6:7]),int(eachelem[2][9:10]),int(eachelem[2][12:13]),int(eachelem[2][15:16]),int(eachelem[2][18:19]),0),eachelem[3],eachelem[4])
   end
 end
outfil=open("comb.csv","w")
# print a header
println(outfil,"Fire,Incdate,dayofweek,hour,month,temperature,IsMonday,IsTuesday,IsWednesday,IsThursday,IsFriday,IsSaturday,IsSunday,tempband1,tempband2,tempband3,tempband4,tempband5a,tempband5b1,tempband5b2,tempband5b3,tempband5b4,tempband5b5,tempband5bz");
 # Iterate through each time loading a fire or not
thisdate=DateTime(2009,5,1,0,0,0,0)
zeroskipped=0
linesprinted=0
while thisdate < DateTime(2014,5,1,0,0,0,0)
  zeroskipped=zeroskipped+1
  # 12 15 18 22
  current_temp=get_adelaide_temp(thisdate)
  tempband1=current_temp<12 ? 12-current_temp : 0
  tempband2=current_temp>12 ? (current_temp<15 ? current_temp-12 : 15-12) : 0
  tempband3=current_temp>15 ? (current_temp<18 ? current_temp-15 : 18-15) : 0
  tempband4=current_temp>18 ? (current_temp<22 ? current_temp-18 : 22-18) : 0
  tempband5a=current_temp>22 ? (current_temp<25 ? current_temp-22 : 25-22) : 0
  tempband5b1=current_temp>25 ? (current_temp<28 ? current_temp-25 : 28-25) : 0
  tempband5b2=current_temp>28 ? (current_temp<31 ? current_temp-28 : 31-28) : 0
  tempband5b3=current_temp>31 ? (current_temp<34 ? current_temp-31 : 34-31) : 0
  tempband5b4=current_temp>34 ? (current_temp<37 ? current_temp-34 : 37-34) : 0
  tempband5b5=current_temp>37 ? (current_temp<40 ? current_temp-37 : 40-37) : 0
  tempband5bz=current_temp>40 ? current_temp-40 : 0
  if (haskey(calllog,thisdate))
    if linesprinted < 1
      print(outfil,"1")
      println(outfil,",\"",thisdate,"\",",dayofweek(thisdate),',',hour(thisdate),',',month(thisdate),',',current_temp,',',dayofweek(thisdate)==1?1:0,',',dayofweek(thisdate)==2?1:0,',',dayofweek(thisdate)==3?1:0,',',dayofweek(thisdate)==4?1:0,',',dayofweek(thisdate)==5?1:0,',',dayofweek(thisdate)==6?1:0,',',dayofweek(thisdate)==7?1:0,',',tempband1,',',tempband2,',',tempband3,',',tempband4,',',tempband5a,',',tempband5b1,',',tempband5b2,',',tempband5b3,',',tempband5b4,',',tempband5b5,',',tempband5bz)
      linesprinted=linesprinted+1
    end
   end
  if zeroskipped >=1
    if linesprinted < 1
        print(outfil,"0")
      println(outfil,",\"",thisdate,"\",",dayofweek(thisdate),',',hour(thisdate),',',month(thisdate),',',current_temp,',',dayofweek(thisdate)==1?1:0,',',dayofweek(thisdate)==2?1:0,',',dayofweek(thisdate)==3?1:0,',',dayofweek(thisdate)==4?1:0,',',dayofweek(thisdate)==5?1:0,',',dayofweek(thisdate)==6?1:0,',',dayofweek(thisdate)==7?1:0,',',tempband1,',',tempband2,',',tempband3,',',tempband4,',',tempband5a,',',tempband5b1,',',tempband5b2,',',tempband5b3,',',tempband5b4,',',tempband5b5,',',tempband5bz)
      end
      zeroskipped=0
      linesprinted=0
    end
 thisdate=thisdate+Dates.Minute(1)
end
close(outfil)
# We know we are finished and how many incidents there were
println("$incidents_loaded incidents loaded")
