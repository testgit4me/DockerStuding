FROM centos:7
RUN yum -y upgrade && yum -y install httpd unzip
ENV HTML html-site-styled
LABEL Maintainer=Nagmet
LABEL Vendor=MyCompany
WORKDIR /var/www/html
ADD https://github.com/testgit4me/$HTML/archive/refs/heads/master.zip ./site.zip
RUN unzip site.zip && mv ./$HTML-master/* . && echo $HTML > ./env.html

COPY cmd.sh /cmd.sh

RUN chmod +x /cmd.sh

CMD /cmd.sh
