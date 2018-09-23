#!/bin/bash
station=Platanenstr.
#url="https://www.nahverkehr-jena.de/fahrplan/haltestellenmonitor.html?tx_akteasygojenah_stopsmonitor[stopName]=$station&id=a"
url="https://www.nahverkehr-jena.de/fahrplan/haltestellenmonitor.html?tx_akteasygojenah_stopsmonitor[stopName]=Platanenstra%C3%9Fe&id=a"
#echo $url
wget -q -O /var/www/html/haltestellenmonitor/index.html $url

sed -i 1,/.*monitoringResult.*/d /var/www/html/haltestellenmonitor/index.html
sed -i '/table/,/$$/d' /var/www/html/haltestellenmonitor/index.html
sed -i '1i<!DOCTYPE html><html><body><table>' /var/www/html/haltestellenmonitor/index.html
#echo "</table></body></html>" >> t

sed -i 's/Kï¿½rze.../0 min/' /var/www/html/haltestellenmonitor/index.html
sed -i 's/fährt//' /var/www/html/haltestellenmonitor/index.html

#/var/www/html/haltestellenmonitor/index.html