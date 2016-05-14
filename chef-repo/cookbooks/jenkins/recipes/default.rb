#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install Docker
include_recipe 'docker::install_docker'
include_recipe 'jenkins::install_jenkins'
