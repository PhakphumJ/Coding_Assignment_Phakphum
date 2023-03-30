## Run this first. 

###### Let's Begin ##### 

### New Makefile for Assignment in Coding for Economist Course.

## Make directory for the project

## Tell Makefile to execute all rules
all: Makedirectory Download Check

# First rule: Make directory to store data, and remove if it already existed.
Makedirectory:
	rm -r ~/Coding-assignment/data; mkdir -p ~/Coding-assignment/data



# Second rule: Go to working Directory and Download data and storing it in the data folder.
Download:
	cd ~/Coding-assignment; pwd; curl -Lo data/hotels-vienna.csv "https://osf.io/download/y6jvb/"

# See the basic info of the downloaded file.
Check: 
	ls -hal ~/Coding-assignment/data/hotels-vienna.csv

	






