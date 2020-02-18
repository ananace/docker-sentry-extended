FROM sentry:9-onbuild

RUN apt-get update -y -q \
 && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev \
 && pip install sentry-ldap-auth sentry-auth-oidc==2.1.0 \
 && apt-get remove -y libsasl2-dev python-dev libldap2-dev libssl-dev \
 && apt-get clean -y
