ARG DEBIAN_TAG=buster
FROM debian:${DEBIAN_TAG}

# Install ansible
RUN apt-get update
RUN apt-get install -y \
    openssh-client \
    python3 \
    python3-pip

ARG ANSIBLE_TAG=2.10.6
RUN pip3 install ansible==${ANSIBLE_TAG}

# Prevent warnings when running playbooks
ENV ANSIBLE_LOCALHOST_WARNING False
RUN mkdir /etc/ansible
RUN touch /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
