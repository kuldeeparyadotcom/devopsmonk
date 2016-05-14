name             'mydocker'
maintainer       'kuldeeparya.com'
maintainer_email 'kuldeeparyadotcom2gmail.com'
license          'All rights reserved'
description      'Wrapper cookbook for docker cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'
depends 	 'docker', '~> 2.0'
