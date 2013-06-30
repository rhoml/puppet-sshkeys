# = Config class for deploy keys
class deploykeys::config (
  $our_group = 'nogroup',
  $our_user  = 'deploy'
) {

  if ! defined(User["${our_user}"]) {
    user { "${our_user}":
      ensure     => 'present',
      gid        => "$our_group",
      shell      => '/bin/bash',
      home       => "/home/${our_user}",
      managehome => 'true' }
  }

  file {
    "/home/${our_user}":
      ensure  => 'directory',
      mode    => '0755',
      owner   => "${our_user}",
      group   => "$our_group",
      require => User["${our_user}"];

    "/home/${our_user}/.ssh":
      ensure  => 'directory',
      mode    => '0755',
      owner   => "${our_user}",
      group   => "$our_group",
      require => File["/home/${our_user}"];

    '/root/.ssh':
      ensure  => 'directory',
      mode    => '0700',
      owner   => 'root',
      group   => 'root';

    "/home/${our_user}/.ssh/id_rsa":
      ensure  => present,
      mode    => '0600',
      owner   => "${our_user}",
      group   => "$our_group",
      source  => 'puppet:///modules/puppet-sshkeys/id_rsa',
      require => File["/home/${our_user}/.ssh"];

    "/home/${our_user}/.ssh/id_rsa.pub":
      ensure  => present,
      mode    => '0600',
      owner   => "${our_user}",
      group   => "$our_group",
      source  => 'puppet:///modules/puppet-sshkeys/id_rsa.pub',
      require => File["/home/${our_user}/.ssh"]
  }
}
