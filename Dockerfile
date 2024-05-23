# SIMPLE DOCKER FILE FOR TESTING ANSIBLE (WARNING: NOT FOR PRODUCTION - USES A ROOT USER)
# DOCKER FILE FOR ANSIBLE
FROM ubuntu:focal
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential
COPY . .
EXPOSE 3000
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
