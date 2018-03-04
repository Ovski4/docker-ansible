ARG DEBIAN_TAG=stretch-20180213
FROM debian:${DEBIAN_TAG}

RUN apt-get update
RUN apt-get install -y \
    git \
    build-essential \
    python \
    python-setuptools

ARG ANSIBLE_TAG=v2.4.2.0-1
RUN git clone https://github.com/ansible/ansible.git \
    --branch ${ANSIBLE_TAG} \
    --single-branch \
    --depth 1 \
    --recurse-submodules

WORKDIR ansible
RUN bash ./hacking/env-setup
RUN easy_install pip
RUN pip install -r ./requirements.txt
RUN make && make install

CMD [ "ansible-playbook", "--version" ]
