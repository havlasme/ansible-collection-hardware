havlasme.hardware.ssacli
========================

[![Apache-2.0 license][license-image]][license-link]

An [Ansible](https://www.ansible.com/) role to install HP ssacli.

Requirements
------------

None.

Role Variables
--------------

```yaml
# the ssacli package state ('present', 'absent', 'latest')
ssacli_state: 'present'
```

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- hosts: all
  tasks:
  - import_role:
      name: havlasme.hardware.ssacli
```

License
-------

Apache-2.0

Author Information
------------------

Created by [Tomáš Havlas](https://havlas.me/).

[license-image]: https://img.shields.io/badge/license-Apache2.0-blue.svg?style=flat-square
[license-link]: ../../LICENSE
