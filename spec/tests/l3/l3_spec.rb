require 'spec_helper'

describe package('neutron-l3-agent') do
  it { should be_installed }
end

describe service('neutron-l3-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe package('neutron-metering-agent') do
  it { should be_installed }
end

describe service('neutron-metering-agent') do
  it { should be_enabled }
  it { should be_running }
end