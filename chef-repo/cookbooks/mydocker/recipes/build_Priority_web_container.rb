#
# Cookbook Name:: mydocker
# Recipe:: build_Priority_web_container
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_container 'Priority_web' do
  repo 'kuldeeparyadotcom/phpapache'
  tag 'snapshot'
  port '80:80'
  links ['Priority_mysql:mysql']
  binds [ '/opt/Priority/src:/var/www/html/' ]
end
