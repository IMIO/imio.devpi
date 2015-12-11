Devpi Dockerfile
================

This repository contains **Dockerfile** of [Devpi](http://doc.devpi.net/) for [Docker](https://www.docker.com/)


Installation
============

1. Install [docker](http://docs.docker.com/engine/installation/) and [docker-compose] (http://docs.docker.com/compose/install/)

2. Build  image with `make docker-image` or `docker-compose build`


Usage
=====

Run
---

    docker-compose up

Devpi creates a user named `root` by default, its password can be set with
`DEVPI_PASSWORD` environment variable (Update docker-compose.yml file)
