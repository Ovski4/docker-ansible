Ansible
=======

A docker image to run ansible

Build
-----

```
git clone git@gitlab.com:ovski4/docker-images.git
cd ansible
docker -t user/ansible:v2.4.2.0-1 build .
```

By default, the base container is debian/stretch-20180213 and the ansible version is v2.4.2.0-1

To specify another debian version, and another ansible release, you can do the following:

```
docker build -t user/ansible:v2.4.2.0-1 --build-arg="ANSIBLE_TAG=v1.4.2.0-1" --build-arg="DEBIAN_TAG=jessie"  .
```

Usage
-----

docker run -v $(pwd):/var user/ansible:v2.4.2.0-1 ansible-playbook /var/playbook.yml 
