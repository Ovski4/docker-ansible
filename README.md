Ansible
=======

A docker image to run ansible

Build
-----

The tag must exist on the [ansible pip repository](https://pypi.org/project/ansible/#history)

```bash
git clone https://github.com/Ovski4/docker-ansible.git
cd docker-ansible
docker build -t ovski/ansible:v2.13.3 .
```

By default, the base container is debian/buster and the ansible version is 6.3.0 .

To specify another debian version, and another ansible release, you can do the following:

```bash
docker build -t ovski/ansible:v2.13.3 --build-arg="ANSIBLE_PIP_TAG=6.3.0" --build-arg="DEBIAN_TAG=bullseye"  .
```

Usage
-----

```bash
# check the version
docker run ovski/ansible:v2.13.3

# run a playbook
docker run -v $(pwd):/var ovski/ansible:v2.13.3 ansible-playbook /var/playbook.yml
```
