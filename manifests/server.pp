####
#
#
#
define nginx::server
(
    $root,
    $server_name     = $name,
    $listen          = 80,
    $error_log       = '/var/log/nginx/error.log',
    $access_log      = '/var/log/nginx/access.log',
    $location        = undef,
    $location_params = [],
    $template        = 'nginx/default.erb'
)
{

    file { "/etc/nginx/sites-available/${name}.conf":
        path    => "/etc/nginx/sites-available/${name}.conf",
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

    file { "/etc/nginx/sites-enabled/${name}.conf":
        ensure  => link,
        target  => "/etc/nginx/sites-available/${name}.conf",
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        notify  => Service['nginx'],
        require => [
            Package['nginx'],
            File["/etc/nginx/sites-available/${name}.conf"],
        ]
    }
}
