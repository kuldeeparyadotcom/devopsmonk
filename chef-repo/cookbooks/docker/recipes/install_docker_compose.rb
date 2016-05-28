#
# Cookbook Name:: docker
# Recipe:: install_docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install docker if it's already not installed

script 'docker_compose_installation' do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
   yum -y update
   curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
   chmod +x /usr/local/bin/docker-compose
  EOH
  not_if { ::File.exist?("/usr/local/bin/docker-compose") }
end
