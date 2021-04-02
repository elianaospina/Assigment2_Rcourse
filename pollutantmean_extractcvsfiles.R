pollutantmean <- function(directory, pollutant, id = 1:332) {
        # add one or two zeros to ID so that they match the CSV file names
        filenames <- sprintf("%03d.csv", id)
        # subset list of sensor files
        filenames <- paste(directory, filenames, sep="/")
        # loop through files in subset list and
        #    * read the csv file
        #    * bind to "collector" data frame
        ldf <- lapply(filenames, read.csv)
        # df is the list of data.frames
        df=ldply(ldf)
        # calculate mean and return to parent environment
        mean(df[, pollutant], na.rm = TRUE)
}


