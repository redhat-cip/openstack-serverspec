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

describe port(35357) do
  it { should be_listening.with('tcp') }
end

describe command('sh -c \'echo "show tables;"|mysql keystone\'') do
  its(:stdout) { should match /.*endpoint.*/ }
end

describe command('sh -c \'echo "select * from endpoint;"|mysql keystone\'') do
  its(:stdout) { should match /http.*/ }
end
