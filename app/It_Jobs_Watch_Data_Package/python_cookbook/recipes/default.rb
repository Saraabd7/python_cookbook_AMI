#
# Cookbook:: python_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update_sources' do
  action :update
end


package 'python3.7' do
  action :install
end

package 'python3-pip' do
  options '--allow-unauthenticated'
  action :install
end

execute 'install python' do
  command 'sudo apt-get install python3.7 -y'
  action :run
end

execute 'install python3-pip' do
  command 'sudo apt-get install python3-pip -y'
  action :run
end

execute 'install requests' do
  command 'pip3 install requests'
  action :run
end

execute 'install bs4' do
  command 'pip3 install bs4'
  action :run
end

execute 'install configmanager' do
  command 'pip3 install configmanager'
  action :run
end

execute 'install pytest' do
  command 'pip3 install pytest'
  action :run
end

# file '/home/ubuntu/app/src/__init__.py' do
#   action :create
# end
#
# file '/home/ubuntu/app/src/csv_generators/__init__.py' do
#   action :create
# end
#
# file '/home/ubuntu/app/src/itjobswatch_html_readers/__init__.py' do
#   action :create
# end

directory '/' do
  action :create
  mode '0777'
end

directory '/vagrant/' do
  action :create
  mode '0777'
end

directory '/home/vagrant/downloads' do
  action :create
  mode '0777'
end

# execute 'install requirements' do
#   command 'pip3 install -r /home/ubuntu/app/requirements.txt'
#   action :run
# end

bash 'installing app requirements' do
  code <<-EOH
    pip3 install atomicwrites==1.3.0
    pip3 install attrs==19.1.0
    pip3 install beautifulsoup4=4.8.0
    pip3 install bs4
    pip3 install certifi==2019.6.16
    pip3 install chardet==3.0.4
    pip3 install config_manager
    pip3 install idna==2.8
    pip3 install importlib-metadata==0.19
    pip3 install more-itertools==7.2.0
    pip3 install packaging==19.1
    pip3 install pluggy==0.13.1
    pip3 install py==1.8.0
    pip3 install pyparsing==2.4.2
    pip3 install pytest==5.1.0
    pip3 install requests==2.22.0
    pip3 install six==1.12.0
    pip3 install soupsieve==1.9.2
    pip3 install urllib3==1.25.3
    pip3 install wcwidth==0.1.7
    pip3 install zipp==0.5.2
  EOH
end
