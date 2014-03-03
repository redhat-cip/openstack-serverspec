require 'spec_helper'

#
# Glance
#

describe service('glance-api') do
  it { should be_enabled }
  it { should be_running }
end

describe service('glance-registry') do
  it { should be_enabled }
  it { should be_running }
end


describe package('glance') do
    it { should be_installed }
end

describe service('glance-api') do
    it { should be_enabled }
    it { should be_running }
end

describe service('glance-registry') do
    it { should be_enabled }
    it { should be_running }
end

describe port(9292) do
  it { should be_listening.with('tcp') }
end

describe port(9191) do
  it { should be_listening.with('tcp') }
end
