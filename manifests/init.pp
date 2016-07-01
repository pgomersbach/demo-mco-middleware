# == Class: demo_mco_middleware
#
# Full description of class demo_mco_middleware here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class demo_mco_middleware
(
  $package_name = $::demo_mco_middleware::params::package_name,
  $service_name = $::demo_mco_middleware::params::service_name,
) inherits ::demo_mco_middleware::params {

  # validate parameters here
  validate_string($package_name)
  validate_string($service_name)

  class { '::demo_mco_middleware::install': } ->
  class { '::demo_mco_middleware::config': } ~>
  class { '::demo_mco_middleware::service': } ->
  Class['::demo_mco_middleware']
}
