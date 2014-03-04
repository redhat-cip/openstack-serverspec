require 'spec_helper'

describe package('heat-api') do
    it { should be_installed }
end

describe service('heat-api') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8004) do
  it { should be_listening.with('tcp') }
end

describe package('heat-api-cfn') do
    it { should be_installed }
end

describe service('heat-api-cfn') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8000) do
  it { should be_listening.with('tcp') }
end

describe package('heat-api-cloudwatch') do
    it { should be_installed }
end

describe service('heat-api-cloudwatch') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8003) do
  it { should be_listening.with('tcp') }
end
