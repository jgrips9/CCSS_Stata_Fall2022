sysuse auto, clear

*create constant variable
generate tax = .08

* create new variable. 8% tax. 
generate price_t = price*1.08
*Can also do other variables 
generate price_t1 = price + price * tax

*mistake. tax for vehicle now is 15 percent. But only for vehicles with mpg > 22

replace price_t = price*1.15 if mpg > 22

*label variables. this should be quick. 
label variable price_t "price with tax included"

*subset data. now going to drop some columns and rows to include only the data that I care about. 
preserve
drop if trunk == 13
drop if price > 5000 & price < 12000
*keep data if rep78 is 3 or 2. otherwise drop. 
keep if rep78 == 3 | rep78 == 2
*keep variables
keep make price mpg
*save dataset. file save as. 
save reduced_data, replace
restore

*collapse command. 
*below only prints results. What if wants this in a dataset. To save and send to others. Collapse command. 
tabstat price mpg, by(foreign) s(mean med sd)

collapse (mean) price_mean = price mpg_mean = mpg (sd) sd_price = price sd_mpg = mpg, by(foreign)

*lastly talk about merge. Switching to a different dataset. 
*sample datasets for merging. 


*merge 1:1
webuse autosize, clear
save car_size, replace
webuse autoexpense, clear
merge 1:1 make using car_size
browse


*merge 1 to many
webuse overlap1, clear
save overlap1, replace
webuse overlap2 
merge 1:m id using overlap1
browse

*if time for reshape, but unlikely.
*Sample dataset for reshape. 
webuse reshape6, clear
reshape wide inc ue, i(id) j(year)
reshape long inc ue, i(id) j(year)