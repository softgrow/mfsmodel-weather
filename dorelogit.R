library(Zelig)
mfs <- read.csv("u:/github/mfsmodel-weather/comb.csv", header=TRUE)
# Tau is set to the true population fraction of ones. Our data set from data.sa.gov.au runs for five
# years from 1st May 2009 to 30th April 2014. So number of rows divided by minutes from start date
# to the finish date, i.e. 5 years.
my.out1 <- zelig(Fire ~ dayofweek + hour + month + temperature, data = mfs, model = "relogit", tau=124664/(365.25*24*60*5))
summary(my.out1)
