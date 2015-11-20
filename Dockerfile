FROM gliderlabs/alpine:3.2

MAINTAINER Takeru Sato <midium.size@gmail.com>

ENV GEOIP_DB_DL_URL_PREF    http://geolite.maxmind.com/download/geoip/database
ENV GEOIP_CNTR_DB           GeoLite2-Country.mmdb
ENV GEOIP_CITY_DB           GeoLite2-City.mmdb
ENV GEOIP_DB_DIR            /usr/share/GeoIP

RUN apk --update add curl \
 && mkdir -p ${GEOIP_DB_DIR} \
 && curl -o /tmp/${GEOIP_CNTR_DB}.gz ${GEOIP_DB_DL_URL_PREF}/${GEOIP_CNTR_DB}.gz \
 && curl -o /tmp/${GEOIP_CITY_DB}.gz ${GEOIP_DB_DL_URL_PREF}/${GEOIP_CITY_DB}.gz \
 && gunzip -c /tmp/${GEOIP_CNTR_DB}.gz > ${GEOIP_DB_DIR}/${GEOIP_CNTR_DB} \
 && gunzip -c /tmp/${GEOIP_CITY_DB}.gz > ${GEOIP_DB_DIR}/${GEOIP_CITY_DB}

VOLUME ${GEOIP_DB_DIR}
