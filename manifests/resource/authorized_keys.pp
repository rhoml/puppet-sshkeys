# = Definde for Bashrc

define deploykeys::resource::authorized_keys(
  $team  = false,
  $user  = 'root',
  $group = 'root'
  ) {

  File {
    owner   => "${user}",
    group   => "${group}",
    mode    => '0644',
  }

## Shared Variables
  $ensure_real = $ensure ? {
    'absent' => absent,
    default  => file,
  }

  file { "${name}":
    ensure   => $ensure_real,
    content  => template('deploykeys/authorized_keys.erb')
  }

}
