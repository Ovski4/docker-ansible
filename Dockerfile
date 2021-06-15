ARG DEBIAN_TAG=buster
FROM debian:${DEBIAN_TAG}

# Install ansible
RUN apt-get update
RUN apt-get install -y \
    openssh-client \
    python3 \
    python3-pip

ARG ANSIBLE_TAG=4.0.0
RUN pip3 install ansible==${ANSIBLE_TAG}

RUN ansible-galaxy collection install community.general
RUN pip3 install jmespath

# Prevent warnings when running playbooks
ENV ANSIBLE_LOCALHOST_WARNING False
RUN mkdir /etc/ansible
RUN touch /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
