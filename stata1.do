

*command window is where I submit my Stata commands. Stata commands are submitted 1 at a time. Even if running in batch mode 1 after the other. 
*Dive right in. Will talk about what we are looking at as things come up. 

*Start with creating log file to keep track of what I input into command window. keep track of my commands and output. 

* command window. enter commands. Test commands to make sure working. Open a system sample dataset. This command will work for all version of stata
sysuse auto, clear
*notice after this copy of command and notes to window above. Also notice variables window gets populated. Select anyone to see its properties. Data type. etc
browse
describe
*above by default will do so on all variables
codebook price mpg
*above can split up so instead of doing so on all variables I can specifiy specific variables and not do on all.

*do some basic summary statistics. 
*grouping variables. 1 way table
tab foreign

*2 way table. include an option to 
tab rep78 foreign

*Bring up help documentation after this command. 
tab rep78 foreign, chi2

*summarize all numeric variable
summarize

*talk about documentation
help summarize
*include an option. 
summarize price mpg, detail



*graphs
histogram price
graph pie, over(rep78) by(foreign, total)

scatter mpg weight

help tabstat
*do so with 
tabstat price mpg, by(foreign) s(mean med sd)

*log close

*exercise below
*load life expectancy data
sysuse lifeexp
*view dataset
*How many regions are there? Which is the most frequint
*Average GNP per capita
*Show average and standard deviation for population growth, life expectancy split by region. 
