#!/usr/bin/env bash
  

sudo ansible-playbook ./ulimit.yml --connection=local
sudo ansible-playbook ./nginx.yml --connection=local
