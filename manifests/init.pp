####
#
# nginx puppet manifest
#
class nginx
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
}
