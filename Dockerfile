ARG DEBIAN_TAG=bullseye
FROM debian:${DEBIAN_TAG}

# Install ansible
RUN apt-get update
RUN apt-get install -y \
    openssh-client \
    python3 \
    python3-pip

ARG ANSIBLE_PIP_TAG=6.3.0
RUN pip3 install ansible==${ANSIBLE_PIP_TAG}

# Prevent warnings when running playbooks
ENV ANSIBLE_LOCALHOST_WARNING False
RUN mkdir /etc/ansible
RUN touch /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
