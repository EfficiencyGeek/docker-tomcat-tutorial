# docker-tomcat-tutorial
A basic tutorial on running a web app on Tomcat using Docker

# Steps
* Install [Docker](https://docs.docker.com/install/).
* Clone this repository: `git clone https://github.com/EfficiencyGeek/docker-tomcat-tutorial`
* `cd 'docker-tomcat-tutorial'`
* `docker build -t mywebapp .`
* `docker run --name mywebappcontainer -p 80:8080 mywebapp`
* Access the root site: http://localhost:80
* Access the Sample App deployed via the Dockerfile: http://localhost/sample 
* While the docker tomcat instance is running, get a shell session via: `docker exec -it mywebappcontainer /bin/bash`
* In the docker tomcat session, press control-c to stop tomcat.
* Remove the container: `docker rm "/mywebappcontainer"`
* Remove the image: `docker rmi "mywebapp"`

# Links
[Sample Tomcat web app](https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/)
