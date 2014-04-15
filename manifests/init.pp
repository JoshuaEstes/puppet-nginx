####
#
# nginx puppet manifest
#
class nginx
(
    $remove_default = true
)
{

    package { 'nginx':
        name   => 'nginx-extras',
        ensure => latest,
    }

    service { 'nginx':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require    => Package['nginx'],
    }

    if $remove_default == true {
        file { '/etc/nginx/sites-enabled/default':
            ensure => absent,
            notify => Service['nginx'],
        }
    }
}
