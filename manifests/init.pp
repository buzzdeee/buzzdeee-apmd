# == Class: apmd
#
# This class managed OpenBSD apmd.
#
# === Parameters
#
# Document parameters here.
#
# [*service_name*]
#    String: The name of the service, default: "apmd"
#
# [*service_ensure*]
#    Enum[running, stopped]: The desired state of apmd, default: "running"
#
# [*service_flags*]
#    String: the service flags, default: '-A'
#
# [*service_enable*]
#    Boolean: enable the service to start at boot? default: True
#
# === Examples
#
#  class { 'apmd': }
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
  Boolean $service_enable,
  Enum[running, stopped, 'running', 'stopped'] $service_ensure,
  String $service_name,
  String $service_flags,
) {
  if $facts['apm_arch'] {
    contain apmd::service
  }
}
