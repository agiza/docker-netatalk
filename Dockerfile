FROM ubuntu:14.04
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

RUN set -x \
		&& apt-get update --quiet \
		&& apt-get install --quiet --yes --no-install-recommends nano libnss-ldap ldap-utils auth-client-config libpam-ldap ldap-auth-config\
				libevent-2.0-5 \
				libssl1.0.0 \
				libgcrypt11 \
				libkrb5-3 libgssapi-krb5-2 \
				libpam0g \
				libwrap0 \
				libdb5.1 \
				libtdb1 \
				libmysqlclient18 \
				libavahi-client3 \
				libacl1 \
				libldap-2.4-2 \
				cracklib-runtime \
				systemtap-sdt-dev \
				libdbus-1-3 \
				libdbus-glib-1-2 \
				libglib2.0-0 \
				libtracker-sparql-0.16-0 \
				libtracker-miner-0.16-0 \
				tracker \
		&& apt-get clean \
		&& auth-client-config -t nss -p lac_ldap

COPY package /

EXPOSE 548

VOLUME ["/var/netatalk", "/etc/netatalk"]

CMD ["netatalk", "-d"]
