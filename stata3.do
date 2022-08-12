*log open
*explain entering commands into do file editor. Paste everything and run sequentially. Maybe on purpose create an error so i can debug that and describe you know where the errors happen. 

*do entire process of a regression. mention clear option when importing data. 
sysuse auto, clear
*going to regression to predict mpg based on vehicle length and weight. My expectation is the larger and heavier the car the lower the mpg. 
*first going through my conditions 
scatter mpg weight
scatter mpg length

*check correlation coefficients. 
corr mpg weight length

*ready for regression now. 
help regress
regress mpg weight length
etable
*add binary varialbe
*domestic ccars have a higher mpg just by a bit. explain the output in detail. 
regress mpg weight length i.foreign

mean mpg
ttest mpg == 15

*then by group. Domestic and foreign
ttest mpg, by(foreign)

*now put the above into a nice looking report. probably use the putexcel, putpdf command. 

putpdf begin

// Create a new paragraph
putpdf paragraph
putpdf text ("Regressions Results MPG changes from car dimensions "), bold


scatter mpg weight
graph export scatterw.png, replace
putpdf paragraph, halign(center)
putpdf image scatterw.png

putpdf paragraph
putpdf text ("Below are regression results for predicting mpg based on weight and length.")
regress mpg weight length
putpdf table mytable = etable

putpdf paragraph
putpdf text ("Below are regression results for predicting mpg based on weight and length.")

putpdf save Regreport.pdf, replace

*could also do asdoc command. 
ssc install asdoc
asdoc corr mpg weight length, append
asdoc regress mpg weight length, append

