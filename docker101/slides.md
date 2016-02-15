# Intro to containers and Docker

by *Adrian Moreno*

---

## Before

- Monolithic apps
- Build on a single stack such as Java or .NET
- Long lived
- Deployed to a single server

----

Figure monolithic app

----

Figure load-balanced monolithic app

----

## Today

- Apps are constantly developed
- New versions are deployed frequently
- Built from loosely coupled components
- Deployed to multiple servers

----

Figure modern app

----

# How do you handle all these parts?

---

# Imagine you own a shipping company

----

Pianos

----

Pianos + Potatos

----

Pianos + Potatos + Whiskey

----

# How do we handle all these differences?

- Size of goods
- Form of goods
- Requirements to keep them safe
- Use different transport methods

----

Intermodal container

----

# Now you can ship everything!

Figure vessel

----

Figure container truck

----

Figure train containers

----

# Yes, but... what does it have to do with software?

----

Figure software in containers

---

# It worked in my computer

----

# The premise of Docker:

## Build once, run anywhere

----

# What is Docker?

----

## Virtualization tool?

Figure vmware, virtualbox

----

## VM manager?

Figure vagrant

----

## Configuration manager?

Figure Puppet, Chef, Ansible

----

## cgroups? LXC? libvirt?



---

## VMs vs Containers

Figure vms vs containers

----

# Containers

### Your applications run in containers

code: docker run ubuntu /bin/echo "Hello World"
Hello World

----

# Images

### Saved states of Containers

Code: docker images

----

# Dockerfile

### Series of commands to build an image

code: dockerfile example

----

# Docker Hub

### Public repository for Docker images

Figure screenshot

---

# Docker in numbers

- Launched in March 2013
- 21,000+ GitHub Stars
- 1B+ Docker Container Downloads
- 240,000+ Dockerized apps in Docker Hub
- 1600+ Community Contributors
- 50,000 Third party projects using Docker
- 200+ Meet Up groups

----

# Docker ecosystem

Figure ecosystem

----


---


# FIN
