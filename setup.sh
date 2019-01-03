
# Create the volume first?
# docker create volume jenkins_home

JENKINS_HOME=/home/bryon/jenkins_home
docker run \
    -p 8080:8080 \
    -p 50000:50000 \
    --security-opt apparmor=docker-default \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$JENKINS_HOME":/var/jenkins_home jenkins/jenkins:lts
