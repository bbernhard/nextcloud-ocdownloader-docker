#! /bin/bash

/tmp/wait-for-it.sh 127.0.0.1:80 -- echo "Nextcloud is up"

echo "Installing ocDownloader"
until runuser -u www-data php occ app:install ocdownloader
do
	echo "ocDownloader installation failed..trying again to install ocDownloader"
done
