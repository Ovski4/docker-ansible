ARG DEBIAN_TAG=buster
FROM debian:${DEBIAN_TAG}

# Install ansible
RUN apt-get update
RUN apt-get install -y \
    git \
    build-essential \
    python \
    python-setuptools \
    python-pip

ARG ANSIBLE_TAG=v2.9.6
RUN git clone https://github.com/ansible/ansible.git /ansible \
    --branch ${ANSIBLE_TAG} \
    --single-branch \
    --depth 1 \
    --recurse-submodules

WORKDIR /ansible
RUN bash ./hacking/env-setup
RUN pip install -r ./requirements.txt
RUN pip install packaging
RUN make && make install

# Prevent warnings when running playbooks
ENV ANSIBLE_LOCALHOST_WARNING False
RUN mkdir /etc/ansible
RUN touch /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
