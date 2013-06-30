# == Class: gwan
#
# This module will help you manage your teams SSH Keys across all of your server
# infrastructure with a couple of easy tweaks. It will also help add a public
# and a private SSH Key on all your nodes.
#
# === Parameters
#
# [*our_group*]
#  This parameter is used to configure the default keys on your server.
#
# [*our_user*]
# This is the path for your document_root
#
# === USAGE
# Include the module on the nodes.pp or site.pp
#
# include puppet-sshkeys
#
# deploykeys::resource::authorized_keys {
#   '/home/deploy/.ssh/authorized_keys':
#     team   => true,
#     user   => 'deploy',
#     group  => 'nogroup'
# }
#
# === Authors
#
# Rhommel Lamas <roml@rhommell.com>
#
# === LICENSE
# MIT
class deploykeys {

  include deploykeys::config

  deploykeys::resource::authorized_keys {
    '/root/.ssh/authorized_keys':
      user      => 'root',
      group     => 'root'
    }
}
