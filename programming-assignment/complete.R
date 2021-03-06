setwd("C:/Big Data/")

complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        ## check/confirm working directory | idea: https://github.com/Xiaodan

        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }

        nobs = numeric() ## a good practice to set the class
        for (i in id) {

        data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
        nobs = c(nobs, sum(complete.cases(data)))

}

return(data.frame(id, nobs))

}

## 15 Feb 2015