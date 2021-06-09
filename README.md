Ansible
=======

A docker image to run ansible

Build
-----

The tag must exist on the [ansible pip repository](https://pypi.org/project/ansible/#history)

```bash
git clone https://github.com/Ovski4/docker-ansible.git
cd docker-ansible
docker build -t ovski/ansible:v4.0.0 .
```

By default, the base container is debian/buster and the ansible version is 4.0.0 .

To specify another debian version, and another ansible release, you can do the following:

```bash
docker build -t ovski/ansible:v2.10.5 --build-arg="ANSIBLE_TAG=2.10.5 ." --build-arg="DEBIAN_TAG=stretch"  .
```

Usage
-----

```bash
# check the version
docker run ovski/ansible:v4.0.0

# run a playbook
docker run -v $(pwd):/var ovski/ansible:4.0.0 ansible-playbook /var/playbook.yml
```
