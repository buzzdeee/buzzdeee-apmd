# Private class, do not use directly.
# This class takes care about the service.
class apmd::service {
  service { $apmd::service_name:
    ensure => $apmd::service_ensure,
    enable => $apmd::service_enable,
    flags  => $apmd::service_flags,
  }
}
