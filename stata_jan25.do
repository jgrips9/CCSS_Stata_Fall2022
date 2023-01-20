/*
1. Open dataset and drop missing responses for variable X. How many observations are left?
2. Report the 10th and 75th percentiles of a given interval variable.
3. Generate an ordinal variable and tell us what % of the sample are in each bin
4. Draw a histogram and select the one that best represents it (show a few options)
5. Make them look through help file for a command and copy-paste something from it
6. calculate some conditional means
7. save the data set and upload do-file

*/


*open sample dataset. I like to use this for practicing my skills. 
sysuse auto, clear

*check for missing values. in all variables
mdesc

*There are missing values in rep78 variable. 

*remove columns with drop/keep commands.
drop headroom
 
*add if condition to remove rows. 
drop if rep78 == .

*include other drop keep options. Mention preserve option
preserve

*MPG between 15 and 35
keep if mpg > 15 & mpg < 35

drop if weight < 2000 | weight > 4500

*Similar with replace option. Maybe include that as the exercise. 
replace rep78 = 2 if rep78 == 1

*get percentiles and stats.
summarize price

*Look at the help documentation. Options and stuff. 
help summarize

*this will do quartiles. 
summarize price mpg, detail

*Exercise
*load life expectancy dataset
sysuse lifeexp, clear

*print summary statistics of popgrowth
*drop all observations that have safewater as missing


*categorical/grouping variables. 
sysuse auto, clear

*frequency counts for ordinal variables
tab foreign

tab rep78, missing

*2way table. 
tab foreign rep78

help hist
hist price
hist price, bin(6)

*include basic regression?

*exercise. 
*load life expectancy dataset
sysuse lifeexp, clear
*print average popgrowth by each region. 
*create histogram of gnppc
