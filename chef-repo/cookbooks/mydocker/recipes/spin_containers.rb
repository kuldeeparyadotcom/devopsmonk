# Cookbook Name:: mydocker
# Recipe:: spin_containers 
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_container 'Priority_mysql' do
  repo 'mysql'
  tag  '5.6'
  env 'MYSQL_ROOT_PASSWORD=password'
end
