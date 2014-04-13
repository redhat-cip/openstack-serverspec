require 'spec_helper'

#################################
#
#         NON-OPENSTACK
#
#################################

#
# MySQL : Ensure the MySQL installation went smoothly
# 
# To ensure installation is correct the following
# conditions needs to be met :
#
# * package 'mariadb-galera-server' needs to be installed
# * service 'mysql' needs to be running and started at boot
# * service has to be listening on port '3306'
# * ensure 'sys_maint' user is installed (IS THIS CORRECT?)
# * if the node tested is the galera master, the '--new-cluster'
#   param needs to be one of 'mysqld' argument
#

# TODO: check user presence command.return_exit_status

describe service('mysql') do
  it { should be_running }
end

describe port(3306) do
  it { should be_listening.with('tcp') }
end

describe port(4567) do
  it { should be_listening.with('tcp') }
end
