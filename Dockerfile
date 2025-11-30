ARG DEBIAN_TAG=trixie
FROM debian:${DEBIAN_TAG}

# Install ansible
RUN apt-get update
RUN apt-get install -y \
    openssh-client \
    python3-venv

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

ARG ANSIBLE_PIP_TAG=13.0.0
RUN pip install ansible==${ANSIBLE_PIP_TAG}

# Prevent warnings when running playbooks
ENV ANSIBLE_LOCALHOST_WARNING=False
RUN mkdir /etc/ansible
RUN touch /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
