FROM nextcloud:latest

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

RUN apt-get update \
	&& apt-get install -y aria2 curl supervisor wget --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /var/log/aria2c /var/local/aria2c
RUN touch /var/log/aria2c/aria2c.log
RUN touch /var/local/aria2c/aria2c.sess
RUN chown www-data.www-data -R /var/log/aria2c /var/local/aria2c
RUN chmod 770 -R /var/log/aria2c /var/local/aria2c
RUN runuser --user www-data -- aria2c --enable-rpc --rpc-allow-origin-all -c -D --log=/var/log/aria2c/aria2c.log --check-certificate=false --save-session=/var/local/aria2c/aria2c.sess --save-session-interval=2 --continue=true --input-file=/var/local/aria2c/aria2c.sess --rpc-save-upload-metadata=true --force-save=true --log-level=warn

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh --directory-prefix=/tmp/ \
	&& chmod +x /tmp/wait-for-it.sh

ENV NEXTCLOUD_UPDATE=1
ENV NEXTCLOUD_ADMIN_USER=admin
ENV NEXTCLOUD_ADMIN_PASSWORD=admin
ENV SQLITE_DATABASE=nextcloud

RUN mkdir -p \
    /var/log/supervisord \
    /var/run/supervisord

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY entrypoint.sh /tmp/entrypoint.sh
COPY installocdownloader.sh /tmp/installocdownloader.sh

CMD ["/tmp/entrypoint.sh"]

