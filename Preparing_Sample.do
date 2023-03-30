clear 

cd "C:\Users\fphak\Coding-assignment"

** Read csv files (outcome #5)
import delimited "data/hotels-vienna.csv"

* see if there's missing values
codebook 

** replace "NA" with . , and destring at the same time (Outcome #6)
destring *, replace ignore("NA")

** select relevant variables (Outcome #7)
keep country city_actual center1label center2label price stars /// 
distance distance_alter accommodation_type rating

** select obs with price >= 100 and drop obs with missing values (Outcome #7)
* drop obs with missing value
generate no_miss = !missing(country, city_actual, center1label, center2label, /// 
price, stars, distance, distance_alter, accommodation_type, rating)

drop if no_miss == 0
* select obs with price >= 100
keep if price >= 100

** create log(price) (Outcome #7)
gen lnprice = log(price)

** save data (Outcome #8)
save "data/cleaned_data.dta", replace
