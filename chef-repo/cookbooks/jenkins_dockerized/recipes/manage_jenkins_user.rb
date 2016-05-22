#
# Cookbook Name:: jenkins_dockerized
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

users_manage 'jenkins' do
  action [:remove, :create]
  data_bag 'users'
end
