require 'spec_helper'

#
# cloud::dashboard
#

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/lib/openstack-dashboard/static/js') do
  it { should be_directory }
  it { should be_owned_by 'horizon' }
  it { should be_grouped_into 'horizon' }
end

describe file('/var/lib/openstack-dashboard/static/css') do
  it { should be_directory }
  it { should be_owned_by 'horizon' }
  it { should be_grouped_into 'horizon' }
end

describe file('/var/log/horizon/horizon.log') do
  it { should be_file }
  it { should be_owned_by 'horizon' }
  it { should be_grouped_into 'horizon' }
end

describe file('/etc/openstack-dashboard/local_settings.py') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /OPENSTACK_KEYSTONE_URL = \"http:\/\/#{property[:vip_public]}:5000\/v2.0\"/ }
end
