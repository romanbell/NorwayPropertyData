# https://www.youtube.com/watch?v=87Gx3U0BDlo

import requests
import csv
from bs4 import BeautifulSoup


def crawl(url):
	global r
	global src
	global divs
	global soup
	global ads
	global links
	global bedroomList

	r = requests.get(url)

	src = r.content
	soup = BeautifulSoup(src, 'html.parser')
	divs = soup.find_all("div", class_="ads__unit__content__keys")
	ads = soup.find_all("div", class_="ads__unit__content__details")
	links = soup.find_all("h2", class_="ads__unit__content__title ads__unit__content__title--fav-placeholder")
	bedroomList = soup.find_all("div", class_="ads__unit__content__list")




i = 1
csvString = "nok-propertiesV-01.csv"
for i in range(1, 6):
	if i == 1:
		csvString = 'nok-propertiesV-01.csv'
		crawl("https://www.finn.no/realestate/homes/search.html?filters=&is_new_property=false")
	if i == 2:
		csvString = 'nok-propertiesV-02.csv'
		crawl("https://www.finn.no/realestate/homes/search.html?filters=&is_new_property=false&page=2")
	if i == 3:
		csvString = 'nok-propertiesV-03.csv'
		crawl("https://www.finn.no/realestate/homes/search.html?filters=&is_new_property=false&page=3")
	if i == 4:
		csvString = 'nok-propertiesV-04.csv'
		crawl("https://www.finn.no/realestate/homes/search.html?filters=&is_new_property=false&page=4")
	if i == 5:
		csvString = 'nok-propertiesV-05.csv'	
		crawl("https://www.finn.no/realestate/homes/search.html?filters=&is_new_property=false&page=5")
		

		
	#Create an excel file
	f = csv.writer(open(csvString, mode = 'w'))


	for ad in ads: #ADDRESS
		#print(ad)
		#f.reader()
		f.writerow({ad.div.text})


	f.writerow("XXXXXXXXXXXXXXXX")


	for div in divs:  #PRICE AND SQM
		#print(div.text)
		f.writerow({div.text})


	f.writerow("XXXXXXXXXXXXXXXX")


	for link in links:
		ref = soup.find_all("a", class_="ads__unit__link")
		f.writerow({link.a.attrs['href']})
		#print(link.a.attrs['href'])

	f.writerow("XXXXXXXXXXXXXXXX")

	for bedroom in bedroomList:
		f.writerow({bedroom.text})
		#print(bedroom.text)

	print("New excel sheet generated -" + "'" + csvString + ".csv'")


#print("-----------------------------------------")


#################################################################




