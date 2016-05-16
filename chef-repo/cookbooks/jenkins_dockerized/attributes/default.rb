node.default['jenkins_dockerized']['image_name']='jenkins'
node.default['jenkins_dockerized']['image_tag']='latest'
node.default['jenkins_dockerized']['container_name']='myjenkins'
node.default['jenkins_dockerized']['admin_port']=8080
node.default['jenkins_dockerized']['slave_port']=50000
node.default['jenkins_dockerized']['jenkins_home']='/home/jenkins/jenkins_home'
node.default['jenkins_dockerized']['java_opts_dhudson_footerurl']='http://devopsmonk.com/'

#Overriding attributes from docker Cookbook
node.default['docker']['user']='jenkins'
node.default['docker']['user_home']='/home/jenkins'
node.default['docker']['user_shell']='/bin/bash'
