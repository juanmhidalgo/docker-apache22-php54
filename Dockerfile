FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
  && apt-get install -y php5 php5-curl php5-mysqlnd \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN apt-get update && yes | apt-get install curl wget vim build-essential checkinstall zip adduser

RUN yes | apt-get install php5 libapache2-mod-php5 \
          php5-fpm php5-cli php5-mysqlnd php5-pgsql php5-sqlite \
          php5-intl php5-imagick php5-mcrypt php5-gd php5-curl


RUN yes | apt-get install imagemagick

COPY apache_default /etc/apache2/sites-available/default

RUN a2enmod rewrite

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
