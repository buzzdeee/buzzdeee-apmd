# Private class, do not use directly.
# The params that steer the module.

class apmd::params {
  if $::osfamily == 'OpenBSD' {
    case $::architecture {
      'alpha': {
        $service_ensure = 'stopped'
        $service_enable = false
        $service_flags = undef
      }
      default: {
        $product = $::dmi[product][name]
        if $product =~ /net5501/ {
          $service_ensure = 'stopped'
          $service_enable = false
          $service_flags = undef
        } else {
          $service_ensure = 'running'
          $service_enable = true
          $service_flags = '-A'
        }
      }
    }
  } else {
    $service_ensure = 'stopped'
    $service_enable = false
  }
}
