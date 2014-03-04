require 'spec_helper'

#
# cloud::dashboard
#

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
