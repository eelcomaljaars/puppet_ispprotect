# manages the license or emits a warning
# that the package is deployed using an
# evaluation license
class ispprotect::license {

  $license       = $ispprotect::license
  $basedir       = $ispprotect::basedir
  $ensure        = $ispprotect::ensure

  if $license == undef {
    notify { 'ISPProtect is commercial software, please purchase a license at https://ispprotect.com/': }

    file { "${basedir}/etc/license": ensure => 'absent', }

  } else {

    file { "${basedir}/etc/license":
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      content => "${license}\n"
    }

  }

}
