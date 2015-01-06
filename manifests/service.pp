# Private class, do not use directly.
# This class takes care about the service.

class apmd::service (
  $service_ensure,
  $service_enable,
  $service_flags,
){
  service { 'apmd':
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }
}
