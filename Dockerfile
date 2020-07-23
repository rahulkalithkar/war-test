FROM tomcat:8.0-alpine

COPY target/*.war webapps/

MAINTAINER "rahulkalithkar1996@gmail.com"
