ARG DEBIAN_TAG=stretch-20180213
FROM debian:${DEBIAN_TAG}

# Install ansible
RUN apt-get update
RUN apt-get install -y \
    git \
    build-essential \
    python \
    python-setuptools \
    cron

ARG ANSIBLE_TAG=v2.7.8
RUN git clone https://github.com/ansible/ansible.git /ansible \
    --branch ${ANSIBLE_TAG} \
    --single-branch \
    --depth 1 \
    --recurse-submodules

WORKDIR /ansible
RUN bash ./hacking/env-setup
RUN easy_install pip
RUN pip install -r ./requirements.txt
RUN pip install packaging
RUN make && make install

# Install borg
RUN apt-get install -y \
    python3 \
    python3-dev \
    python3-pip \
    python-virtualenv \
    libssl-dev openssl \
    libacl1-dev libacl1 \
    build-essential \
    borgbackup

CMD [ "ansible-playbook", "--version" ]
