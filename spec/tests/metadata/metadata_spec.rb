require 'spec_helper'

describe package('neutron-metadata-agent') do
  it { should be_installed }
end

describe service('neutron-metadata-agent') do
  it { should be_enabled }
  it { should be_running }
end
