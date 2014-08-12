server-base
===========

a server with basic features

License
-------

MIT License

Architectures
-------------

- using CentOS dist
- less hole

Dependencies
------------

- Vagrant
- Ansible
- ruby gem "bundler"

Usage
-----

Hit the commands below to setup

```sh
> vagrant up
> cd ansible
> ansible-playbook playbook.yml
```

At the end of setup, tests with serverspec run.
When you wanna run serverspec alone, a set of commands below are useful.

```sh
> cd serverspec
> bundle exec rake serverspec
```
