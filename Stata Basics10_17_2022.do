webuse wageed
*wages 20-74 year olds in 2015.

*print number of rows. describe dataset. 
count
describe

*undo function. 
preserve
drop if age > 70

keep if tenuregrp == 0 | tenuregrp == 4

keep if wage > 15 & wage < 25

*do quick 5 number summary of wage.
summarize wage 

restore


*perform exercise 1
*load auto dataset.
sysuse auto, clear
*what is the average weight of car in dataset?
*Remove the missing values in rep78.
*Keep data where mpg is greater than 20. How does this affect the average weight?  
*could also do below.




webuse wageed, clear

su wage if age > 45


bysort college: su wage

*Then frequency counts. 
tab college

tab college tenuregrp, chi2

 
ttest wage, by(college)

*create graphs. Show using the menu and also looking up for code options. Graphs not in menu


*Then perform exercise on auto dataset. summary stats, frequency table, t.test foreign. Graphs.
sysuse auto, clear
*create a histogram of price.
*create a pie chart of rep78 variable. Bonus, split by foreign variable.
*perform t test to campare average miles per gallon by domestic and foreign vehicles(foreign). Are the results significant. 
* Keep cars where price of vehicle(price) is between $5000 - $10000


