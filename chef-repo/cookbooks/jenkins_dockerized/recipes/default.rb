#
# Cookbook Name:: jenkins_dockerized
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'docker::default'
include_recipe 'jenkins_dockerized::install_jenkins'
include_recipe 'jenkins_dockerized::manage_jenkins_user'
