FROM debian:stretch-slim
MAINTAINER Amane Katagiri
CMD ["sks", "-disable_mailsync", "-dontgossip", "-stdoutlog", "db"]

RUN apt update && apt install -y --no-install-recommends sks && \
    service sks stop && update-rc.d -f sks remove && \
    mkdir /var/run/sks && sed -i -e "s/^hkp_address:.*$/hkp_address: 0.0.0.0/g" /etc/sks/sksconf && \
    su debian-sks -c '/usr/sbin/sks build'
