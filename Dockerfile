FROM ubuntu:14.04
MAINTAINER Scott Wilson <scott.wilson@gmail.com>

RUN apt-get update -qq && apt-get install -y mysql-server-5.6

ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 664 /etc/mysql/conf.d/my.cnf
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# 14.04 + 5.6 quirk
RUN touch /usr/share/mysql/my-default.cnf

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD ["/usr/local/bin/run"]
