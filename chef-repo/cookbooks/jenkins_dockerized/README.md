# jenkins_dockerized

Purpose
This cookbook installs jenkins as a docker container.
It depends on cookbook docker.

Detailed Task description
1. Using docker cookbook user jenkins is set up
2. Jenkins home is set up for jenkins_home persistence
3. Jenkins container is launched and if it is already launched it is removed first


Assumptions:
Docker Engine must be configured and running on node

Reference:
https://hub.docker.com/_/jenkins/
