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

First, create conf.yml file to specify IP address and host name.
Copy conf.yml.example and modify it.

```sh
> cp conf.yml.example conf.yml
> vi conf.yml
```

Hit the commands below to setup

```sh
> vagrant up
> cd ansible
> ansible-playbook playbook.yml --extra-vars "@../conf.yml"
```

At the end of setup, tests with serverspec run.
When you wanna run serverspec alone, a set of commands below are useful.

```sh
> cd serverspec
> bundle exec rake serverspec
```

Questions and Answers
---------------------

### Why don't you specify the "playbook.yml" to Vagrant provisioner?

To disable SELinux, I need to reboot the host.

Rebooting vagrant hosts require the command `vagrant reload`, but it has a restrict that it is avaiable only when host has no vagrant process.
Vagrant provisioners are run by Vagrant itself, so there is no chance to reboot hosts with provisioner.
