In this repository you can find exemplary code I wrote for previous projects. 


Visualization of scWGBS data

The files of this project provide graphical representation of basic quality control including coverage statistics, 
methylation distribution, per chromsome depth of coverage information.

* data_overview.Rmd: 
  
  In this file two RDS files containing information on the methylation status of CpG sites are used to create data frames for several different features.
  These data frames then serve as input for ggplot2. 
  
* data_summary.Rmd:
  
  In this file more detailed information on CpG content and sequencing depth is extracted for each sample and again used for graphical representation via ggplot2.
    



Basic statistics of qPCR data 

* ttest.Rmd:

In this file a Welch Two Sample T-Test is performed on dCT values from TaqMan Assay. 
Therefore, data is loaded from a CSV file and transformed into a data frame. 
Then the dCT values are seperated by target gene and filtered for tumor patients and controls. 
Subsequently, t-test is performed and results are plotted.
