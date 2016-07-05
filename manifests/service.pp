# == Class demo_mco_middleware::service
#
# This class is meant to be called from demo_mco_middleware.
# It ensure the service is running.
#
class demo_mco_middleware::service {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }
}
