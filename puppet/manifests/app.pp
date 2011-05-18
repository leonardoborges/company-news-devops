import "base.pp"

class app inherits base {
  package { "tomcat6":
    ensure  => "installed"
  }
  
  service { 'tomcat6':
      ensure => running,
      require => [Package['tomcat6'], File['/etc/tomcat6/tomcat6.conf']],
  }  
  
  file { "/etc/tomcat6/tomcat6.conf":
    ensure => "present",
    source  => "file://${files_dir}/tomcat6.conf",    
    owner => tomcat,
    group => tomcat,
    require => Package['tomcat6'],
  }  
  
  file { "/var/db/prevayler":
    ensure => "directory",
    owner => tomcat,
    group => tomcat,
    require => File["/etc/tomcat6/tomcat6.conf"],
  }
}

include app
