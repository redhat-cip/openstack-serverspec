require 'spec_helper'

#################################
#
#         NON-OPENSTACK
#
#################################


# RabbitMQ : Ensure the RabbitMQ installation went smoothly
# 
# To ensure installation is correct the following
# conditions needs to be met :
#
# * package 'rabbitmq-server' needs to be installed
# * service 'rabbitmq-server' needs to be running and started at boot
# * process 'epmd' needs to be running
# * service has to be listening on port '5672', '4369'
# * ensure the index 'ceilometer' is installed
#

describe package('rabbitmq-server') do
  it { should be_installed }
end

describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end

# rabbitmq (epmd)
describe port(4369) do
  it { should be_listening.with('tcp') }
end

# rabbitmq (beam)
describe port(5672) do
  it { should be_listening }    # don't specify tcp or tcp6 as netstat reports it in different ways
end

describe process('epmd') do
  it { should be_running }
end

describe file('/etc/rabbitmq/rabbitmq.config') do
  it { should be_mode 644 }
  it { should be_owned_by 'root' }

  its(:content) { should match /\{rabbit, \[\{cluster_nodes, \[.*'rabbit@#{property[:hostname]}'.*\]\}\]\}/ }
end

# Disable for now, until it's fixed
#describe 'rabbitmq_cluster_status' do
#  output = command("rabbitmqctl cluster status").stdout
#  nodes = /\{nodes,\[\{disc,\[([^\]]*)\]\}\]\}/.match(output)[0].split(',').sort()
#  running_nodes = /\{running_nodes,\[([^\]]*)\]\}/.match(output)[0].split(',').sort()
#  running_nodes.should be = nodes
#end
#
#describe command('rabbitmqctl cluster_status') do
#  it { should return_exit_status 0 }
#  it { should return_stdout /^\[\{nodes,\[\{disc,\]\}\]\}$/ }
#  it { should return_stdout /^\[\{running_nodes,\[\{disc,\]\}\]\}$/ }
#end
#
#describe command('rabbitmqctl list_users') do
#  it { should return_stdout /^ceilometer/ }
#  it { should return_stdout /^cinder/ }
#  it { should return_stdout /^glance/ }
#  it { should return_stdout /^heat/ }
#  it { should return_stdout /^neutron/ }
#  it { should return_stdout /^nova/ }
#
#  it { should_not return_stdout /^guest/ }
#end
#
#describe command('rabbitmqctl list_permissions') do
#  it { should return_stdout /^ceilometer *\.\* *\.\* *\.\*$/ }
#  it { should return_stdout /^cinder *\.\* *\.\* *\.\*$/ }
#  it { should return_stdout /^glance *\.\* *\.\* *\.\*$/ }
#  it { should return_stdout /^heat *\.\* *\.\* *\.\*$/ }
#  it { should return_stdout /^neutron *\.\* *\.\* *\.\*$/ }
#  it { should return_stdout /^nova *\.\* *\.\* *\.\*$/ }
#end
