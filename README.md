# docker-tomcat-tutorial
A basic tutorial on running a web app on Tomcat using Docker

# Steps
* Install [Docker](https://docs.docker.com/install/).
* Clone this repository: `git clone https://github.com/EfficiencyGeek/docker-tomcat-tutorial`
* `cd 'docker-tomcat-tutorial'`
* `./runme.sh start`
* Available Sites: http://localhost
    *   Sample App: http://localhost/sample 
    *   Tomcat Samples: http://localhost/examples
    *   Tomcat Docs: http://localhost/docs
* While the docker tomcat instance is running, get a shell session via: `docker exec -it mywebappcontainer /bin/bash`
* In the docker tomcat session, press control-c to stop tomcat.
* Remove the container: `docker rm "mywebapp"`
* Remove the image: `docker rmi "mywebapp"`

# Links
[Sample Tomcat web app](https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/)

# Next
1. /manager and /host-manager webapps are having errors.
