require 'spec_helper'

#################################
#
#         NON-OPENSTACK
#
#################################

# MongoDB : Ensure the MongoDB installation went smoothly
# 
# To ensure installation is correct the following
# conditions needs to be met :
#
# * '10gen' repos are installed
# * package 'mongodb-10gen' needs to be installed
# * service 'mongodb' needs to be running and started at boot
# * service has to be listening on port '27017' and '28017'
# * ensure the index 'ceilometer' is installed
#

describe file('/etc/apt/sources.list.d/mongodb.list') do
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  its(:content) { should match /deb http:\/\/downloads-distro\.mongodb\.org\/repo\/debian-sysvinit dist 10gen/ }
end

describe package('mongodb-10gen') do
  it { should be_installed }
end

describe service('mongodb') do
  it { should be_enabled }
  it { should be_running }
end

describe port(27017) do
  it { should be_listening.with('tcp') }
end

describe port(28017) do
  it { should be_listening.with('tcp') }
end
