Ansible
=======

A docker image to run ansible

Build
-----

The tag must exist on the [ansible repository](https://github.com/ansible/ansible/tags)

```bash
git clone https://github.com/Ovski4/docker-ansible.git
cd docker-ansible
docker build -t ovski/ansible:v2.8.2 .
```

By default, the base container is debian/stretch-20190610 and the ansible version is v2.8.2

To specify another debian version, and another ansible release, you can do the following:

```bash
docker build -t ovski/ansible:v2.4.2.0-1 --build-arg="ANSIBLE_TAG=v1.4.2.0-1" --build-arg="DEBIAN_TAG=stretch"  .
```

Usage
-----

```bash
# check the version
docker run ovski/ansible:v2.8.2

# run a playbook
docker run -v $(pwd):/var ovski/ansible:v2.8.2 ansible-playbook /var/playbook.yml 
```