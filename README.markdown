#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with wintersmith](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module helps install [wintersmith](http://wintersmith.io/) and maintain any number of wintersmith sites.

## Module Description

This module depends on [nodejs](https://forge.puppetlabs.com/puppetlabs/nodejs)
to install wintersmith, and
[vcsrepo](https://forge.puppetlabs.com/puppetlabs/vcsrepo) to actually checkout your blog!

## Setup

```puppet
include wintersmith
```

## Usage

after that, we can define a blog:

```puppet
wintersmith::site { 'blag':
  ensure => 'latest',
  source => 'git://github.com/igalic/blag',
  target => '/srv/web/blag.esat',
}
```

## Reference

### wintersmith class

*package_name*
 Package name of wintersmith. (Default: `wintersmith`)

*package_ensure*
 Ensure wintersmith package is installed (or uninstalled or in a specific
 version. (Default: `present`)

*path*
 Default Exec path (where to find the wintersmith binary) (Default:
 `/usr/bin:/bin:/usr/local/bin`)

### wintersmith::site defined type

*ensure*
 Ensure vcs is present (or absent, or latest). (Default: `present`)

*source*
  source URI to the vcs repository. (This parameter must be set)

*target*
  target dir where to put the vcs repository. (This parameter must be set)

*vcs_provider*
 VCS provider. (Default: `git`)

*vcs_revision*
 VCS revision. (Default: `master`)

## Limitations

Tested on Ubuntu. If vcsrepo, and npm runs on it, and you can adapt the `path`,
it should on run on your OS!

## Development

Fork, branch, patch, pull request, etc.

