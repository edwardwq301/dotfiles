# use puppet to automate bootstrap a new linux machine
$user_name = "wq"
user{ $user_name :
    comment => 'add user',
    ensure     => present,
    managehome => true,
    home => "/home/$user_name";
}

file { "/home/$user_name":
    ensure => 'directory',
    owner =>"$user_name",
    require =>User["$user_name"];
}

# Allow the user to run sudo commands without a password
#file { '/etc/sudoers.d/$user_name':
#    ensure  => present,
#    content => "newuser ALL=(ALL) NOPASSWD: ALL\n",
#    mode    => '0440',
#}

package{['fish','git','tmux']:
    ensure=>'installed';
}

exec {'install fisher':
    command => '/usr/bin/curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher',
    
    logoutput => 'true',
    refreshonly => 'true';
}

