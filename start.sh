#! /bin/sh

cd /sickbeard

git pull origin

if [ -f /config/config.ini ]
then
	rm -rf /sickbeard/config.ini
	rm -rf /sickbeard/sickbeard.db
else
	mv -f /sickbeard/config.ini /config/config.ini
	mv -f /sickbeard/sickbeard.db /config/sickbeard.db
fi
ln -sf /config/config.ini /sickbeard/
ln -sf /config/sickbeard.db /sickbeard/sickbeard.db

/usr/bin/python SickBeard.py
