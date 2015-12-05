#
# Cookbook Name:: mydocker
# Recipe:: build_phpapache_image 
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

bash 'build_docker_image' do
  cwd '/opt/Priority/'
  code <<-EOH
    /opt/Priority/buildDockerImage
    EOH
end
