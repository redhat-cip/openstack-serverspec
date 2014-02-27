require 'spec_helper'

####################################
#
#         OpenStack Network services
#
####################################

describe service('neutron-dhcp-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe service('neutron-l3-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe service('neutron-metadata-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe service('neutron-lbaas-agent') do
  it { should be_enabled }
  it { should be_running }
end
