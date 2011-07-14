
class openstack_admins_users {
  include sudoers
  
  group { 'corvus':
    ensure => 'present'
  }

  user { 'corvus':
    ensure => 'present',
    comment => 'James E. Blair',
    home => $operatingsystem ? {
      Darwin => '/Users/corvus',
      solaris => '/export/home/corvus',
      default => '/home/corvus',
    },
    shell => '/bin/bash',
    gid => 'corvus',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'corvushome':
    name => $operatingsystem ? {
      Darwin => '/Users/corvus',
      solaris => '/export/home/corvus',
      default => '/home/corvus',
    },
    owner => 'corvus',
    group => 'corvus',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'corvussshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/corvus/.ssh',
      solaris => '/export/home/corvus/.ssh',
      default => '/home/corvus/.ssh',
    },
    owner => 'corvus',
    group => 'corvus',
    mode => 600,
    ensure => 'directory',
    require => File['corvushome'],
  }

  file { 'corvuskeys':
    name => $operatingsystem ? {
      Darwin => '/Users/corvus/.ssh/authorized_keys',
      solaris => '/export/home/corvus/.ssh/authorized_keys',
      default => '/home/corvus/.ssh/authorized_keys',
    },
    owner => 'corvus',
    group => 'corvus',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvKYcWK1T7e3PKSFiqb03EYktnoxVASpPoq2rJw2JvhsP0JfS+lKrPzpUQv7L4JCuQMsPNtZ8LnwVEft39k58Kh8XMebSfaqPYAZS5zCNvQUQIhP9myOevBZf4CDeG+gmssqRFcWEwIllfDuIzKBQGVbomR+Y5QuW0HczIbkoOYI6iyf2jB6xg+bmzR2HViofNrSa62CYmHS6dO04Z95J27w6jGWpEOTBjEQvnb9sdBc4EzaBVmxCpa2EilB1u0th7/DvuH0yP4T+X8G8UjW1gZCTOVw06fqlBCST4KjdWw1F/AuOCT7048klbf4H+mCTaEcPzzu3Fkv8ckMWtS/Z9Q== jeblair@operational-necessity
    ensure => 'present',
    require => File['corvussshdir'],
  }

  file { 'corvusbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/corvus/.bashrc',
      solaris => '/export/home/corvus/.bashrc',
      default => '/home/corvus/.bashrc',
    },
    owner => 'corvus',
    group => 'corvus',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'corvusbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/corvus/.bash_logout',
      solaris => '/export/home/corvus/.bash_logout',
      default => '/home/corvus/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'corvus',
    group => 'corvus',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'corvusprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/corvus/.profile',
      solaris => '/export/home/corvus/.profile',
      default => '/home/corvus/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'corvus',
    group => 'corvus',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'jaypipes':
    ensure => 'present'
  }

  user { 'jaypipes':
    ensure => 'present',
    comment => 'Jay Pipes',
    home => $operatingsystem ? {
      Darwin => '/Users/jaypipes',
      solaris => '/export/home/jaypipes',
      default => '/home/jaypipes',
    },
    shell => '/bin/bash',
    gid => 'jaypipes',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'jaypipeshome':
    name => $operatingsystem ? {
      Darwin => '/Users/jaypipes',
      solaris => '/export/home/jaypipes',
      default => '/home/jaypipes',
    },
    owner => 'jaypipes',
    group => 'jaypipes',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'jaypipessshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/jaypipes/.ssh',
      solaris => '/export/home/jaypipes/.ssh',
      default => '/home/jaypipes/.ssh',
    },
    owner => 'jaypipes',
    group => 'jaypipes',
    mode => 600,
    ensure => 'directory',
    require => File['jaypipeshome'],
  }

  file { 'jaypipeskeys':
    name => $operatingsystem ? {
      Darwin => '/Users/jaypipes/.ssh/authorized_keys',
      solaris => '/export/home/jaypipes/.ssh/authorized_keys',
      default => '/home/jaypipes/.ssh/authorized_keys',
    },
    owner => 'jaypipes',
    group => 'jaypipes',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5d2DekN5POb+e04tVtC/pok7r0Lg/+90sbvhgLTDKSGM7uPI83ulH4sZrMKVU5NTK4GBh9G+RNK6UaKodNiBGKiHZ4QdaMqbkP3TIXd3uDEBUefEAzSqpCGydbjpmtxFZWtA5hcKXTSpMRbbx/vek3lYIRsQaU0Ezc7V0cczSmJBGA6VH22TIW/5wkVvZQozK2jdkIAnJhdL7CN5kKyGs94CfXN9ofNr1ssVb/tPJqSotx7FDcrwT9VmEWTn/nCuoWf42sVu0RIHVMSpr5sxFa+G33omeRLOSCCD+zYZoMCEHZTFNCXZhPWGebWhgGHsu0+bN6heRmoJ8lw01gHxWQ== jpipes@serialcoder\nssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAt2tCgmlHEj5huGLJTPM2pV+aj6ZObneGq92m30LsKOn2SMrC9y4PpqjlRDweduBDKK2cPSnHt3HL1jM5npLh5IGHN2FxAWo3spgwpWPhdkT1VbdyiTZPw4++y/qZhWdNvEWBpNcf3Zn2Qi0x7F1+5fCri/vwVA9RBG35wozaP0mkxaJuAS/LLR7ZJIF99Fqfdk6+Fp5mobXt0ggEqs/78MhCuE2AYaNZ/VWCoanL4w6+UJwZV1Ftd9Ksx6f+8NpaOC9WlNSxJmp2EDJsLBy8mpJh1OsAjC3hu1VvQYmYhSo47ADSfAw9h7aaLUcL6hb7w2n4f+9Ej2+L6+NzEm0Izw== jpipes@serialcoder",
    ensure => 'present',
    require => File['jaypipessshdir'],
  }

  file { 'jaypipesbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/jaypipes/.bashrc',
      solaris => '/export/home/jaypipes/.bashrc',
      default => '/home/jaypipes/.bashrc',
    },
    owner => 'jaypipes',
    group => 'jaypipes',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'jaypipesbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/jaypipes/.bash_logout',
      solaris => '/export/home/jaypipes/.bash_logout',
      default => '/home/jaypipes/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'jaypipes',
    group => 'jaypipes',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'jaypipesprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/jaypipes/.profile',
      solaris => '/export/home/jaypipes/.profile',
      default => '/home/jaypipes/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'jaypipes',
    group => 'jaypipes',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'john-purrier':
    ensure => 'present'
  }

  user { 'john-purrier':
    ensure => 'present',
    comment => 'John Purrier',
    home => $operatingsystem ? {
      Darwin => '/Users/john-purrier',
      solaris => '/export/home/john-purrier',
      default => '/home/john-purrier',
    },
    shell => '/bin/bash',
    gid => 'john-purrier',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'john-purrierhome':
    name => $operatingsystem ? {
      Darwin => '/Users/john-purrier',
      solaris => '/export/home/john-purrier',
      default => '/home/john-purrier',
    },
    owner => 'john-purrier',
    group => 'john-purrier',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'john-purriersshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/john-purrier/.ssh',
      solaris => '/export/home/john-purrier/.ssh',
      default => '/home/john-purrier/.ssh',
    },
    owner => 'john-purrier',
    group => 'john-purrier',
    mode => 600,
    ensure => 'directory',
    require => File['john-purrierhome'],
  }

  file { 'john-purrierkeys':
    name => $operatingsystem ? {
      Darwin => '/Users/john-purrier/.ssh/authorized_keys',
      solaris => '/export/home/john-purrier/.ssh/authorized_keys',
      default => '/home/john-purrier/.ssh/authorized_keys',
    },
    owner => 'john-purrier',
    group => 'john-purrier',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAruUSC26oZvATKLklfJDpp8g/os1YYIypnQUw856znEgRc2mo2l9ASkwE9+zlPZWYpBT6kVtVfN85WyMJM5oq38T9VdPmMQ3ecgrqR7JdFPmmdAkAMzn2RlGPBZr9A//UxZnATFKxF/ZKwDEmIB2zfJ8dr6NSEDGaWC+IWdHNYSU= john@openstack.org",
    ensure => 'present',
    require => File['john-purriersshdir'],
  }

  file { 'john-purrierbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/john-purrier/.bashrc',
      solaris => '/export/home/john-purrier/.bashrc',
      default => '/home/john-purrier/.bashrc',
    },
    owner => 'john-purrier',
    group => 'john-purrier',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'john-purrierbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/john-purrier/.bash_logout',
      solaris => '/export/home/john-purrier/.bash_logout',
      default => '/home/john-purrier/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'john-purrier',
    group => 'john-purrier',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'john-purrierprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/john-purrier/.profile',
      solaris => '/export/home/john-purrier/.profile',
      default => '/home/john-purrier/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'john-purrier',
    group => 'john-purrier',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'mordred':
    ensure => 'present'
  }

  user { 'mordred':
    ensure => 'present',
    comment => 'Monty Taylor',
    home => $operatingsystem ? {
      Darwin => '/Users/mordred',
      solaris => '/export/home/mordred',
      default => '/home/mordred',
    },
    shell => '/bin/bash',
    gid => 'mordred',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'mordredhome':
    name => $operatingsystem ? {
      Darwin => '/Users/mordred',
      solaris => '/export/home/mordred',
      default => '/home/mordred',
    },
    owner => 'mordred',
    group => 'mordred',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'mordredsshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/mordred/.ssh',
      solaris => '/export/home/mordred/.ssh',
      default => '/home/mordred/.ssh',
    },
    owner => 'mordred',
    group => 'mordred',
    mode => 600,
    ensure => 'directory',
    require => File['mordredhome'],
  }

  file { 'mordredkeys':
    name => $operatingsystem ? {
      Darwin => '/Users/mordred/.ssh/authorized_keys',
      solaris => '/export/home/mordred/.ssh/authorized_keys',
      default => '/home/mordred/.ssh/authorized_keys',
    },
    owner => 'mordred',
    group => 'mordred',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAr+HlnLCCMnAqP6bvAQmb6aMfNjwp425OuG9nlN6uXXEymP5G/WT/Ok2RWb+O1hsaRGsvwHrkCdhCvT0XrDIWRCK3vaQ/v0LogeRbX5HIdOrH6r5N++DV9SqVTFZ6+54CfOE/pyku6pkBdoM8WJ9EIQBQC82EE6mgtpS/UNdiymsoB+2I8yNwUROm/AROCjqN60PI/2j234qYYaUXoD/FM3ZE/cfUoTTi0NAbt5OM5pCHPfaWhWCYtQ4l2CnEXXhKU9TcoQVoTu54IBAmblgD2LeJnOsKQtVcd5rgGzl/OtkL1ZvWCq23LHMeOC2WANgWIyxp4x66m51uErbgnTwOkQ== monty@sanction\nssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwgRJ+iQMzive6pq8f/F4N0CN0+SptI5l+yj10Rx3i80Zh4a3ERratuIsEmuyyeBU/l+dmR074Jic/42rYnQJBEKT5bvGLhiftcSUu630NZgAFnP5e4TbpHlYJzXDxOOctAHyd8TH5iQftWeNi5NIYAwfYpO6a4/GE1InMcyqW+icyDxyt3rwDN0qzLHcVFdCgWPsbEuJuqweH/qsen78LNWPro+ynk6dnsSKhe8dWkhYjPhAEjbsL13VezksHNbk2aa/yvppCCgdLdvniaQDKr+F0/X5Xp1teL8L7Rr9Ei+I3l6Ge4I3KY0s8TM+6TpAp4GGvdKakOBeoSAP5wYjrw== root@camelot
    ensure => 'present',
    require => File['mordredsshdir'],
  }

  file { 'mordredbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/mordred/.bashrc',
      solaris => '/export/home/mordred/.bashrc',
      default => '/home/mordred/.bashrc',
    },
    owner => 'mordred',
    group => 'mordred',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'mordredbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/mordred/.bash_logout',
      solaris => '/export/home/mordred/.bash_logout',
      default => '/home/mordred/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'mordred',
    group => 'mordred',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'mordredprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/mordred/.profile',
      solaris => '/export/home/mordred/.profile',
      default => '/home/mordred/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'mordred',
    group => 'mordred',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'dendrobates':
    ensure => 'present'
  }

  user { 'dendrobates':
    ensure => 'present',
    comment => 'Rick Clark',
    home => $operatingsystem ? {
      Darwin => '/Users/dendrobates',
      solaris => '/export/home/dendrobates',
      default => '/home/dendrobates',
    },
    shell => '/bin/bash',
    gid => 'dendrobates',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'dendrobateshome':
    name => $operatingsystem ? {
      Darwin => '/Users/dendrobates',
      solaris => '/export/home/dendrobates',
      default => '/home/dendrobates',
    },
    owner => 'dendrobates',
    group => 'dendrobates',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'dendrobatessshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/dendrobates/.ssh',
      solaris => '/export/home/dendrobates/.ssh',
      default => '/home/dendrobates/.ssh',
    },
    owner => 'dendrobates',
    group => 'dendrobates',
    mode => 600,
    ensure => 'directory',
    require => File['dendrobateshome'],
  }

  file { 'dendrobateskeys':
    name => $operatingsystem ? {
      Darwin => '/Users/dendrobates/.ssh/authorized_keys',
      solaris => '/export/home/dendrobates/.ssh/authorized_keys',
      default => '/home/dendrobates/.ssh/authorized_keys',
    },
    owner => 'dendrobates',
    group => 'dendrobates',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyPD6HkWT4pz20Ygfo72MxiMsCc4JmlVq/LO0GQRw1ZBG4f0rkjegYBDFLLzOR60RPfqpvb3OApJBHcx3HJG9IxtPc5yZN615sBwPOLK6SWO9kFMhBVq4w3uQFIvpONyR7KbRlWJFVn1W02pRkGGp//bN15h6Ry24kfzEgcjOMbq9vb57/dumj9tL6pZyBSWLgOjWj70KEo/n8Z9AFn7lZOZgq4fmqMuDD79ahsjnwGpKjh2v/SIALV2AjYWJOwY/0ou7l7ghVvfOB4ZOgSYDxhz2/ORqL4yUzncyChcLH1Xg5nscvc+yaOatMaXtVlkPAEPDUSzfho8DyAqt1tjRKw== rclark@blackcat
    ensure => 'present',
    require => File['dendrobatessshdir'],
  }

  file { 'dendrobatesbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/dendrobates/.bashrc',
      solaris => '/export/home/dendrobates/.bashrc',
      default => '/home/dendrobates/.bashrc',
    },
    owner => 'dendrobates',
    group => 'dendrobates',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'dendrobatesbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/dendrobates/.bash_logout',
      solaris => '/export/home/dendrobates/.bash_logout',
      default => '/home/dendrobates/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'dendrobates',
    group => 'dendrobates',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'dendrobatesprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/dendrobates/.profile',
      solaris => '/export/home/dendrobates/.profile',
      default => '/home/dendrobates/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'dendrobates',
    group => 'dendrobates',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'soren':
    ensure => 'present'
  }

  user { 'soren':
    ensure => 'present',
    comment => 'Soren Hansen',
    home => $operatingsystem ? {
      Darwin => '/Users/soren',
      solaris => '/export/home/soren',
      default => '/home/soren',
    },
    shell => '/bin/bash',
    gid => 'soren',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'sorenhome':
    name => $operatingsystem ? {
      Darwin => '/Users/soren',
      solaris => '/export/home/soren',
      default => '/home/soren',
    },
    owner => 'soren',
    group => 'soren',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'sorensshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/soren/.ssh',
      solaris => '/export/home/soren/.ssh',
      default => '/home/soren/.ssh',
    },
    owner => 'soren',
    group => 'soren',
    mode => 600,
    ensure => 'directory',
    require => File['sorenhome'],
  }

  file { 'sorenkeys':
    name => $operatingsystem ? {
      Darwin => '/Users/soren/.ssh/authorized_keys',
      solaris => '/export/home/soren/.ssh/authorized_keys',
      default => '/home/soren/.ssh/authorized_keys',
    },
    owner => 'soren',
    group => 'soren',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA7bpJJzvwa4KKzxk9fyegkCUKKOA1gttDJdB+E2mllxcDkScYRYoFnwiq0kl1BwkNFRXj10pguhI/7O3escSvF3Di2Lw4haHR8my6yaz7jFlBbBw8+6j5RbIRnTORS5G4mH4LtAxToGomfJd9gxWpVMiqLa4V7Hg8K6CYRSSUOWzqs7Y/Hv13ASr8ZbaweB1ygVE8kbKuW2ILcqRrKYKaQDeh+aPqLsXDNhT2k2WLsTIqMTSKy70sHqyCjD2joRVBuTiqt1uaQqYCJWT8vuDvXsF0Lmi4tMjRF7GOuOKd0QsT5y8C8dLHWDfeBNQJv46dZE6UUHOfhucTM4w73zpXaw== soren@butch\nssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8YfXbgi0uNZEpOxLvzPdGgo5dAAjqVUGf+kU1bvxcZf3y7a2veDXOOnez4VGl6OC1bgeENW/5O2hKi0wUG3XMWp8uLVSupI6A8o+cBCu7MYzChMdgullBEh7Bz4cbvoMmQiWOZPPsZLTTrl7E6SJJ5jTTn8IsSkCp21m2Sr4b5SWj+Nw43NVtGYFtBBG/OoixlxcNutiSn7YjOH6CAVOhKpTNddwqECKBfxCdS2kYrMzJw8/QhA9FwJHoFt3PevuC4I/9ARlyZCsbOY+ENc2NtFXNVnF5m6tE/eDZFTt652pNPlldWAaVBzKDZ4CUi4HS3WDxGcVqhtaNawIV6sR8w== soren@intel
    ensure => 'present',
    require => File['sorensshdir'],
  }

  file { 'sorenbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/soren/.bashrc',
      solaris => '/export/home/soren/.bashrc',
      default => '/home/soren/.bashrc',
    },
    owner => 'soren',
    group => 'soren',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'sorenbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/soren/.bash_logout',
      solaris => '/export/home/soren/.bash_logout',
      default => '/home/soren/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'soren',
    group => 'soren',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'sorenprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/soren/.profile',
      solaris => '/export/home/soren/.profile',
      default => '/home/soren/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'soren',
    group => 'soren',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'ttx':
    ensure => 'present'
  }

  user { 'ttx':
    ensure => 'present',
    comment => 'Thierry Carrez',
    home => $operatingsystem ? {
      Darwin => '/Users/ttx',
      solaris => '/export/home/ttx',
      default => '/home/ttx',
    },
    shell => '/bin/bash',
    gid => 'ttx',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'ttxhome':
    name => $operatingsystem ? {
      Darwin => '/Users/ttx',
      solaris => '/export/home/ttx',
      default => '/home/ttx',
    },
    owner => 'ttx',
    group => 'ttx',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'ttxsshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/ttx/.ssh',
      solaris => '/export/home/ttx/.ssh',
      default => '/home/ttx/.ssh',
    },
    owner => 'ttx',
    group => 'ttx',
    mode => 600,
    ensure => 'directory',
    require => File['ttxhome'],
  }

  file { 'ttxkeys':
    name => $operatingsystem ? {
      Darwin => '/Users/ttx/.ssh/authorized_keys',
      solaris => '/export/home/ttx/.ssh/authorized_keys',
      default => '/home/ttx/.ssh/authorized_keys',
    },
    owner => 'ttx',
    group => 'ttx',
    mode => 640,
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAz4Mu4IhAg3/AY4fCnAomOAJIkJS4YnTlTXiIikUIqS/R
    ensure => 'present',
    require => File['ttxsshdir'],
  }

  file { 'ttxbashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/ttx/.bashrc',
      solaris => '/export/home/ttx/.bashrc',
      default => '/home/ttx/.bashrc',
    },
    owner => 'ttx',
    group => 'ttx',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'ttxbash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/ttx/.bash_logout',
      solaris => '/export/home/ttx/.bash_logout',
      default => '/home/ttx/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'ttx',
    group => 'ttx',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'ttxprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/ttx/.profile',
      solaris => '/export/home/ttx/.profile',
      default => '/home/ttx/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'ttx',
    group => 'ttx',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



  group { 'wreese':
    ensure => 'present'
  }

  user { 'wreese':
    ensure => 'present',
    comment => 'Will Reese',
    home => $operatingsystem ? {
      Darwin => '/Users/wreese',
      solaris => '/export/home/wreese',
      default => '/home/wreese',
    },
    shell => '/bin/bash',
    gid => 'wreese',
    groups => ['wheel','sudo','admin'],
    membership => 'minimum',
  }

  file { 'wreesehome':
    name => $operatingsystem ? {
      Darwin => '/Users/wreese',
      solaris => '/export/home/wreese',
      default => '/home/wreese',
    },
    owner => 'wreese',
    group => 'wreese',
    mode => 644,
    ensure => 'directory',
  }
    
  
  file { 'wreesesshdir':
    name => $operatingsystem ? {
      Darwin => '/Users/wreese/.ssh',
      solaris => '/export/home/wreese/.ssh',
      default => '/home/wreese/.ssh',
    },
    owner => 'wreese',
    group => 'wreese',
    mode => 600,
    ensure => 'directory',
    require => File['wreesehome'],
  }

  file { 'wreesekeys':
    name => $operatingsystem ? {
      Darwin => '/Users/wreese/.ssh/authorized_keys',
      solaris => '/export/home/wreese/.ssh/authorized_keys',
      default => '/home/wreese/.ssh/authorized_keys',
    },
    owner => 'wreese',
    group => 'wreese',
    mode => 640,
    content => "",
    ensure => 'present',
    require => File['wreesesshdir'],
  }

  file { 'wreesebashrc':
    name => $operatingsystem ? {
      Darwin => '/Users/wreese/.bashrc',
      solaris => '/export/home/wreese/.bashrc',
      default => '/home/wreese/.bashrc',
    },
    owner => 'wreese',
    group => 'wreese',
    mode => 640,
    source => "/etc/skel/.bashrc",
    replace => 'false',
    ensure => 'present',
  }

  file { 'wreesebash_logout':
    name => $operatingsystem ? {
      Darwin => '/Users/wreese/.bash_logout',
      solaris => '/export/home/wreese/.bash_logout',
      default => '/home/wreese/.bash_logout',
    },
    source => "/etc/skel/.bash_logout",
    owner => 'wreese',
    group => 'wreese',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }

  file { 'wreeseprofile':
    name => $operatingsystem ? {
      Darwin => '/Users/wreese/.profile',
      solaris => '/export/home/wreese/.profile',
      default => '/home/wreese/.profile',
    },
    source => "/etc/skel/.profile",
    owner => 'wreese',
    group => 'wreese',
    mode => 640,
    replace => 'false',
    ensure => 'present',
  }



}
  