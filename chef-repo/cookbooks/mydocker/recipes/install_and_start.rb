#
# Cookbook Name:: mydocker
# Recipe:: startDockerDaemon 
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
docker_service 'default' do
  action [:create, :start]
end
