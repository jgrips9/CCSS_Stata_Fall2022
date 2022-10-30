
import delimited using "https://raw.githubusercontent.com/jgrips9/CCSS_Stata_Fall2022/main/demo_data_practice.csv", clear
save demographics, replace

import delimited using "https://raw.githubusercontent.com/jgrips9/CCSS_Stata_Fall2022/main/income_data_practice.csv", clear
save income, replace

use demographics, clear
merge 1:1 id year using income
save combined, replace

use combined, clear
drop _merge
reshape wide income fam_size, i(id) j(year)
save wide, replace

reshape long income fam_size, i(id) j(year)


*exercise
*merge datasets autosize and autoexpense 1 to 1 by make. Open datasets below by running following commands.
*webuse autosize, clear
*webuse autoexpense, clear
*save dataset
*reshape dataset reshape6 from long to wide with income each year as column. Open dataset using command below.
*webuse reshape6, clear
 


*merge 1 to many
webuse overlap1, clear
save overlap1, replace
webuse overlap2 
merge 1:m id using overlap1
browse



*download all data zip files. 
*https://www.cdc.gov/nchs/data_access/cmf.htm

*set directory to location of wher efiles are stored. 
cd "C:\Users\PhotonUser\Downloads"
infix state 1-2 county 3-5 year 6-9 race 10 births 11-18 using Pop6878.txt, clear
save pop6878, replace

infix state 1-2 county 3-5 year 6-9 race 10 births 11-18 using Pop7988.txt, clear
save pop7988, replace

append using pop6878
save pop6888, replace


infix state te 1-2 county 3-5 year 6-9 race 10 deaths 20-23 using Mort6878.txt, clear
collapse (sum) deaths, by( state county year race)
save mort6878, replace

infix state 1-2 county 3-5 year 6-9 race 10 deaths 20-23 using Mort7988.txt, clear
collapse (sum) deaths, by( state county year race)
save mort7988, replace

append using mort6878
save mort6888, replace

use mort6888, clear
merge 1:1 state county year race using pop6888
keep if _merge == 3




