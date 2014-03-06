require 'spec_helper'

describe package('neutron-dhcp-agent') do
  it { should be_installed }
end

describe service('neutron-dhcp-agent') do
  it { should be_enabled }
  it { should be_running }
end