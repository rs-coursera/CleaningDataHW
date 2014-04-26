Getting and Cleaning Data Project Assignment
============================================


Prepare and Run
---------------

The setup requires following actions:

1. Download the data archive from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Copy the downloaded zip file to working directory
3. Download the [run_analysis.R file from Github](https://github.com/rs-coursera/CleaningDataHW/blob/master/run_analysis.R) and put it into working directory
4. From the R prompt run the following command:

        source("run_analysis.R")

5. If run is successful, one should expect output similar to the one below:

        [1] "Loading utils library."    
        [1] "Extracting ZIP file."
        [1] "reading mapping data into data frames"
        [1] "reading training dataset"
        [1] "reading test dataset"
        [1] "Merging two datasets"
        [1] "Decoding activity names"
        [1] "Calculating means for Subject/Activity Group"
        [1] "Saving tidy dataset to file 'output.txt'"
        [1] "Done!"

6. output.txt file will be produced in the working directory

More Information
----------------

More details is provided in the [CodeBook.md](CodeBook.md) file.