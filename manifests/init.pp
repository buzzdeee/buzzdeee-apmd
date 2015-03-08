# == Class: apmd
#
# Full description of class apmd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'apmd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class apmd (
  $service_enable = $apmd::params::service_enable,
  $service_ensure = $apmd::params::service_ensure,
  $service_flags  = $apmd::params::service_flags,
) inherits apmd::params {
  if $::apm_arch {
    class { 'apmd::service':
      service_enable => $service_enable,
      service_ensure => $service_ensure,
      service_flags  => $service_flags,
    }
  }
}
