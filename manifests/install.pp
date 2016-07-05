# == Class demo_mco_middleware::install
#
# This class is called from demo_mco_middleware for install.
#
class demo_mco_middleware::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  class { '::rabbitmq':
    delete_guest_user => true,
  }
}
