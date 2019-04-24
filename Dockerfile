FROM sentry:9-onbuild

RUN apt-get update -y -q \
 && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev \
 && pip install sentry-ldap-auth sentry-auth-oidc \
 && yes | pip uninstall requests \
 && find /usr -type f -iname '*.pyc' -print0 | xargs -0r /bin/rm -f \
 && yes | pip install 'requests<2.21.0,>=2.20.0' \
 && apt-get remove -y libsasl2-dev python-dev libldap2-dev libssl-dev \
 && apt-get autoremove -y \
 && apt-get clean -y
