# == Class demo_mco_middleware::config
#
# This class is called from demo_mco_middleware for service config.
#
class demo_mco_middleware::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

}
