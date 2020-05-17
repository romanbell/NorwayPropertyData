#libraries
library(readxl)
library(data.table)
library(sp)
library(rgdal)
library(ggplot2)

Google_Sample_Data <- read_excel("C:/Users/StevensUser/Desktop/1%/NORGE/Good Data.xlsx")
#View(Google_Sample_Data)


#read data from table
norge_dat = fread("C:/Users/StevensUser/Desktop/1%/NORGE/Good Data.csv")

#convert to data table
norge_dat = as.data.table(norge_dat)

 
#making spatial data
coordinates(norge_dat) = c("Google_Longitude","Google_Latitude") 
crs.geo1 = CRS("+proj=longlat")
proj4string(norge_dat) = crs.geo1

#plot(norge_dat, pch = 19, col = rgb(1,.8,.8))


#Read Shapefile of Norway
norway = readOGR(dsn = "C:/Users/StevensUser/Desktop/1%/NORGE/Shapefile/Norway-admin", layer = "NOR_adm0") #Norway Shapefile
#norway = readOGR(dsn = "C:/Users/StevensUser/Desktop/1%/NORGE/Shapefile/Cities/Oslo", layer = "OSLO3")  #OSLO Shapefile
#norway = readOGR(dsn = "C:/Users/StevensUser/Desktop/1%/NORGE/Shapefile/Cities/Bergen", layer = "BERGEN") #BERGEN Shapefile
plot(norway)

#Overlay Cooridnates to shapefile
points(norge_dat, pch = 20, col = "red")

points(norge_dat[1:200,1], pch = 20, col = rgb(1,0,0))
points(norge_dat[11:20,1], pch = 20, col = rgb(1,.2,.2))
points(norge_dat[21:30,1], pch = 20, col = rgb(1,.4,.4))
points(norge_dat[31:40,1], pch = 20, col = rgb(1,.6,.6))
points(norge_dat[41:49,1], pch = 20, col = rgb(1,.8,.8))
#19 is large dots, 20 is smaller


cat("---------------USD/SQFT---------------", "\n", 
    "Mean: ",mean(norge_dat$`USD/SQFT`, na.rm=TRUE), "\n",
    "Median: ", median(norge_dat$`USD/SQFT`, na.rm=TRUE), "\n",
    "SD: ", sd(norge_dat$`USD/SQFT`, na.rm=TRUE), "\n",
    "MAX: ", max(norge_dat$`USD/SQFT`, na.rm=TRUE),"\n",
    "MIN: ", min(norge_dat$`USD/SQFT`, na.rm=TRUE),"\n",
    "--------------------------------------"
)

cat("--------------PRICE (USD)-------------", "\n", 
    "Mean: ",mean(norge_dat$`Price (USD)`, na.rm=TRUE), "\n",
    "Median: ", median(norge_dat$`Price (USD)`, na.rm=TRUE), "\n",
    "SD: ", sd(norge_dat$`Price (USD)`, na.rm=TRUE), "\n",
    "MAX: ", max(norge_dat$`Price (USD)`, na.rm=TRUE),"\n",
    "MIN: ", min(norge_dat$`Price (USD)`, na.rm=TRUE),"\n",
    "--------------------------------------"
)

