# == Class demo_mco_middleware::config
#
# This class is called from demo_mco_middleware for service config.
#
class demo_mco_middleware::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  rabbitmq_vhost { 'mcollective':
    ensure => present,
  }

  rabbitmq_user { 'mcollective':
    admin    => false,
    password => 'changeme',
    tags     => ['monitoring', 'tag1'],
  }

  rabbitmq_user { 'admin':
    admin    => true,
    password => 'changeme',
  }

  rabbitmq_user_permissions { 'mcollective@mcollective':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }

  rabbitmq_user_permissions { 'admin@mcollective':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }

  rabbitmq_exchange { 'mcollective_broadcast@mcollective':
    user     => 'mcollective',
    password => 'changeme',
    type     => 'topic',
    ensure   => present,
  }

  rabbitmq_exchange { 'mcollective_directed@mcollective':
    user     => 'mcollective',
    password => 'changeme',
    type     => 'direct',
    ensure   => present,
  }

}
