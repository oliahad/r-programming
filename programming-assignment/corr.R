setwd("C:/Big Data/")

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        ## check/confirm working directory | idea: https://github.com/Xiaodan

        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }

        dataframe = complete(directory) ## load the complete dataframe
        IDs = dataframe[dataframe["nobs"] > threshold, ]$id ## valid IDs

        result = numeric() ## a good practice to set the class

        for (i in IDs) {

                data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
                workingdataframe = data[complete.cases(data), ] ## note to self – it's the original 'data', stupid; not the 'dataframe' to be sourced...long time debugging!
                result = c(result, cor(workingdataframe$sulfate, workingdataframe$nitrate))

        }

        return(result)

}

## 15 Feb 2015