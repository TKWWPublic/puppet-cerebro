class cerebro (
  $service_ensure      = $::cerebro::params::service_ensure,
  $service_enable      = $::cerebro::params::service_enable,
  $version             = $::cerebro::params::version,
  $secret              = $::cerebro::params::secret,
  $hosts               = $::cerebro::params::hosts,
  $basepath            = $::cerebro::params::basepath,
  $shell               = $::cerebro::params::shell,
  $cerebro_user        = $::cerebro::params::cerebro_user,
  $package_url         = $::cerebro::params::package_url,
  $java_opts           = $::cerebro::params::java_opts,
  $java_home           = $::cerebro::params::java_home,
  $basic_auth_settings = $::cerebro::params::basic_auth_settings,
) inherits cerebro::params {

  contain '::cerebro::user'
  contain '::cerebro::install'
  contain '::cerebro::config'
  contain '::cerebro::service'

  Class['cerebro::user']
  -> Class['cerebro::install']
  -> Class['cerebro::config']
  ~> Class['cerebro::service']

  Class['cerebro::install']
  ~> Class['cerebro::service']
}
