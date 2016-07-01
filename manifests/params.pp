# == Class demo_mco_middleware::params
#
# This class is meant to be called from demo_mco_middleware.
# It sets variables according to platform.
#
class demo_mco_middleware::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'demo_mco_middleware'
      $service_name = 'demo_mco_middleware'
    }
    'RedHat', 'Amazon': {
      $package_name = 'demo_mco_middleware'
      $service_name = 'demo_mco_middleware'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
