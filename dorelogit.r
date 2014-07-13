using(Zelig)
mfs <- read.csv("/Users/alex/Documents/MFS-Modelling/comb.csv", header=TRUE)
my.out1 <- zelig(Fire ~ dayofweek + hour + month, data = mfs, model = "relogit", tau=30446/(365.25*24*60*5))
summary(my.out1)
