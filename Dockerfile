FROM phusion/baseimage

MAINTAINER Alledia <suport@alledia.com>

# Install the packages
RUN apt-get -y update \
        && apt-get install -y \
            curl \
            procps \
            unzip \
            apache2 \
            php5 \
            libicu-dev \
            mysql-server \
            libapache2-mod-php5 \
            php5-curl \
            php5-mysql \
            php5-mcrypt \
            php5-curl \
            php5-gd \
            php5-intl \
            php5-xmlrpc \
            php5-xsl \
        && apt-get purge -y \
        && rm -rf /var/lib/apt/lists/*

# Configure Apache
COPY apache/sites-available/default.conf /etc/apache2/sites-available/default.conf

# Add the installer files
ADD . /build

# Exposes the port 80
EXPOSE 80

# Run the installer
CMD sh /build/install.sh
