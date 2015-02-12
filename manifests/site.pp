# == Define: wintersmith::site
#
# This define creates a site by checking out a $source and running wintersmith
# build. You are responsible for "hosting" it yourself!
#
# === Parameters
# [*ensure*]
#   Ensure vcs is present (or absent, or latest). (Default: `present`)
#
# [*source*]
#    source URI to the vcs repository. (This parameter must be set)
#
# [*target*]
#    target dir where to put the vcs repository. (This parameter must be set)
#
# [*vcs_provider*]
#   VCS provider. (Default: `git`)
#
# === Example:
#
#    wintersmith::site { 'blag':
#      ensure       => 'latest',
#      source       => 'git://github.com/igalic/blag',
#      target       => '/srv/web/blag.esat',
#    }
#
class wintersmith::site (
  source,
  target,
  ensure       => 'present',
  vcs_provider => 'git',
) {

  exec { "${module_name}::site[install ${title}'s dependencies]":
    command     => 'npm install',
    path        => $::wintersmith::path,
    cwd         => $target,
    refreshonly => true,
    require     => Vcsrepo[$target],
  }

  exec { "${module_name}::site[rebuild ${title}]":
    command     => 'wintersmith build',
    path        => $::wintersmith::path,
    cwd         => $target,
    refreshonly => true,
    require     => Exec["${module_name}::site[install ${title}'s dependencies"],
    subscribe   => Vcsrepo[$target],
  }

  vcsrepo { $target:
    ensure   => $ensure,
    provider => 'npm',
    name     => $package_name,
  }
}
