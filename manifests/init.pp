# == Class: wintersmith
#
# This class installs wintersmith itself, using nodejs' npm package provider
#
# === Parameters
#
# [*package_name*]
#   Package name of wintersmith. (Default: `wintersmith`)
#
# [*package_ensure*]
#   Ensure wintersmith package is installed (or uninstalled or in a specific
#   version. (Default: `present`)
#
# [*path*]
#   Default Exec path (where to find the wintersmith binary) (Default:
#   `/usr/bin:/bin:/usr/local/bin`)
#
class wintersmith (
  $package_name   = 'wintersmith',
  $package_ensure = 'present',
  $path           = '/usr/bin:/bin:/usr/local/bin',
) {

  package { 'wintersmith':
    ensure   => $package_ensure,
    provider => 'npm',
    name     => $package_name,
  }
}
