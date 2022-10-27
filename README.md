# openssl_build

![CI](https://github.com/tatsuto-iijima/ansible-role-openssl-build/actions/workflows/molecule.yml/badge.svg)

Ansible role that builds OpenSSL from source.

## Requirements

The supported Ansible version are as follows:
- 2.13

The OpenSSL versions that can be installed with this Role are as follows:
- 1.1.1

The supported platforms are as follows:
- CentOS 7
- CentOS 8
- RHEL 8

## Role Variables

Required:

- `openssl_build_version`: string

  Version of OpenSSL to install (ex. `1.1.1q`)

Optional:

- `openssl_build_unarchive_remote_src`: boolean (default: no)

  Whether to download the OpenSSL sources on a remote server

- `openssl_build_unarchive_dest`: path (default: /usr/local/src)

  OpenSSL unarchive dest

- `openssl_build_config_option`: list / elements=string (default: [])

  OpenSSL config option

- `openssl_build_make_target`: list / elements=string (default: ["all", "install"])
  
  OpenSSL make target

## Dependencies

Nothing.

## Example Playbook

An example of using this role is as follows:

```
- hosts: servers
  roles:
      - role: tatsuto_iijima.openssl_build
        openssl_build_version: 1.1.1q
        openssl_build_config_option:
          - "--prefix=/usr/local/openssl"
          - "'-Wl,-rpath,$(LIBRPATH)'"
        openssl_build_make_target:
          - "all"
          - "install_sw"
          - "install_docs"
```

## License

Apache License, Version 2.0
