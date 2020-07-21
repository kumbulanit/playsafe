
from ubuntu:16.04
maintainer kumbulani
RUN apt-get update && apt-get install apache2 -y
RUN apt-get install software-properties-common -y
RUN LC_ALL=C.UTF-8 apt-add-repository ppa:ondrej/php
RUN apt-get update -y 
RUN apt-get install -y php7.2 
RUN apt-get install -y php7.2-curl php7.2-gd php7.2-json php7.2-mbstring
#RUN apt-get install php7.2 php7.2-cli php7.2-common -y
#RUN apt-get install php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-intl php7.2-mysql php7.2-xml php7.2-zip -y
RUN echo "date.timezone = Africa/Johannesburg" > /etc/php/7.2/apache2/php.ini
RUN mkdir /var/www/html/web/
RUN mkdir /var/www/html/web/public/
RUN mkdir /var/www/html/web/logs/
copy index.html /var/www/html/web/public
copy info.php /var/www/html/web/public
copy info.php /var/www/html
copy playsafe.conf /etc/apache2/sites-available/
RUN a2ensite playsafe.conf
RUN apachectl -t
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
