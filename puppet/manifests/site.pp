# make sure the packages are up to date before beginning
#exec { 'apt-get update':
#  command => '/usr/bin/apt-get update'
#}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
File { owner => 0, group => 0, mode => 0644 }

exec { 'nvm-install':
  command => 'curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | /bin/bash',
  creates => '/home/vagrant/.nvm',
  user => 'vagrant',
  environment => 'HOME=/home/vagrant'
}

exec { 'node-install':
  command => '/bin/bash -c ". /home/vagrant/.nvm/nvm.sh && nvm install 0.12 && nvm alias default 0.12"',
  user => 'vagrant',
  environment => 'HOME=/home/vagrant',
  require => Exec['nvm-install']
}

exec { 'npm-update':
  command => '/bin/bash -c ". /home/vagrant/.nvm/nvm.sh && npm update -g npm"',
  user => 'vagrant',
  environment => 'HOME=/home/vagrant',
  require => Exec['nvm-install']
}
