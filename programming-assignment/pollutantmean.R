setwd("C:/Big Data/")

pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

        ## check/confirm working directory | idea: https://github.com/Xiaodan

        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }

        data = numeric() ## a good practice to set the class

        ## filename <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")
        ## path <- paste(directory, "/", filename, sep = "")
        ## frame <- read.csv(path)

        ## pollutantdata <- frame[[pollutant]]
        ## pollutantdata[!is.na(pollutantdata)]

        ## pollutantlists <- sapply(id, function(id) pollutants(directory, pollutant, id))
        ## pollutants <- unlist(pollutantlists)
        ## mean(pollutants)

        data <- sapply(id, function(id) read.csv(paste(directory, "/", formatC(id, width = 3, flag = "0"), ".csv", sep = ""))[[pollutant]])

        result <- mean(unlist(data), na.rm = TRUE)
        return(round(result, 3))

}

## 15 Feb 2015