clear all

* import cleaned data
use "data/cleaned_data.dta"

** create a scatterplot (Outcome #10)
graph twoway (lfit rating  stars) (scatter rating stars)


** save the graph (Outcome #11)
graph export "Scatterplot.png", as(png) replace
