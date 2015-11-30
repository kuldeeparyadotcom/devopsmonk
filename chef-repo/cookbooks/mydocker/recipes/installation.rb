#
# Cookbook Name:: mydocker
# Recipe:: installation
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
docker_installation 'default' do
  repo 'test'
  action :create
end
