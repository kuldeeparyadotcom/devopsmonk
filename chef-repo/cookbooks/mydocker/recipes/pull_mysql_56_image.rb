#
# Cookbook Name:: mydocker
# Recipe:: pull_mysql_56
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_image 'mysql' do
  tag '5.6'
  action :pull
end
