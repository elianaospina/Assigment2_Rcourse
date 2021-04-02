complete <- function(directory, id = 1:332) {
        # identify files to read from disk
        count_complete <- function(fname) sum(complete.cases(read.csv(fname)))
        # read files in order specified by id argument and create nobs vector
        # containing complete cases
        fnames <- list.files(directory, full.names=TRUE)[id]
        # create a data frame with columns id and nobs, and return to
        # parent environment
        data.frame(id = id, complete = unlist(lapply(fnames, count_complete)))
}