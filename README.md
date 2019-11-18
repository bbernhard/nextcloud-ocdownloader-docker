# nextcloud + ocDownloader Dockerfile

This Dockerfile pulls the latest nextcloud docker image, installs all the necessary dependencies for [ocDownloader](https://github.com/e-alfred/ocdownloader) and automatically installs
and enables the ocDownloader app. 

# HOWTO

* clone repository with `git clone https://github.com/bbernhard/nextcloud-ocdownloader-docker.git`
* cd `nextcloud-ocdownloader-docker`
* build docker image with `docker build -t nextcloud-ocdownloader-docker .`
* start docker container with `docker run -p 8080:80 -it nextcloud-ocdownloader-docker`
* open your favorite webbrowser and navigate to `http://127.0.0.1:8080` to connect to your nextcloud docker instance
* you should now be able to login with the username `admin` and the password `admin`
* if you go to the apps tab on your nextcloud instance, you should see that `ocDownloader` is already installed and enabled

**CAUTION: THIS DOCKERFILE WAS MAINLY CREATED FOR TESTING PURPOSES. IF YOU WANT TO USE THE DOCKERFILE IN PRODUCTION, MAKE SURE TO CHANGE THE HARDCODED NEXTCLOUD ADMIN PASSWORD IN THE DOCKERFILE** 
