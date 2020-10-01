FROM xwiki:11.10.10-postgres-tomcat

ADD http://central.maven.org/maven2/org/tuckey/urlrewritefilter/4.0.3/urlrewritefilter-4.0.3.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/
ADD ./web_patch.diff /
RUN patch /usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml web_patch.diff
