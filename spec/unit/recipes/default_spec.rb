#
# Cookbook:: python_cookbook_AMI
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'python_cookbook_AMI::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

  it 'should update source list' do
       expect(chef_run).to update_apt_update 'update_sources'
     end

     it 'should install python' do
       expect(chef_run).to install_package 'python3.7'
     end

     it 'should install python-pip' do
       expect(chef_run).to install_package 'python3-pip'
     end

     it 'should install requests plugin using pip manager' do
       expect(chef_run).to run_execute('install requests')
     end

     it 'should install bs4 using pip manager' do
       expect(chef_run).to run_execute('install bs4')
     end

     it 'should install configmanager using pip manager' do
       expect(chef_run).to run_execute('install configmanager')
     end

     it 'should install pytest using pip manager' do
       expect(chef_run).to run_execute('install pytest')
     end
   end

  # context 'When all attributes are default, on CentOS 7' do
  #   # for a complete list of available platforms and versions see:
  #   # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
  #   platform 'centos', '7'
  #
  #   it 'converges successfully' do
  #     expect { chef_run }.to_not raise_error
  #   end

end
