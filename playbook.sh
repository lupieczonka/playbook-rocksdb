#!/bin/bash
set -eux

playbook_dir=/opt/playbook-rocksdb
working_dir=/opt/ansible-bootstrap
venvdir=${VENV_DIR:-$working_dir/venv}

# set up virtualenv
virtualenv $venvdir
set +e; set +u
source ${venvdir}/bin/activate
set -e; set -u

ANSIBLE_ROLES_PATH=$working_dir/roles \
ansible-playbook \
-i "localhost," \
-c local \
$playbook_dir/playbook.yml

#-e 'ansible_python_interpreter=python' \




