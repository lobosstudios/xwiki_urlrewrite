FROM xwiki:15.5.0-mariadb-tomcat

ADD https://repo1.maven.org/maven2/org/tuckey/urlrewritefilter/4.0.3/urlrewritefilter-4.0.3.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/
COPY ./urlrewrite.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/
RUN apt-get update && \
  apt-get --no-install-recommends -y install \
    patch && \
  rm -rf /var/lib/apt/lists/*
ADD ./web_patch.diff /
RUN patch /usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml /web_patch.diff
