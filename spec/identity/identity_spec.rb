require 'spec_helper'
#
# Keystone
#
describe package('keystone') do
    it { should be_installed }
end

describe service('keystone') do
    it {should be_enabled }
    it {should be_running }
end

describe port(5000) do
  it { should be_listening.with('tcp') }
end
