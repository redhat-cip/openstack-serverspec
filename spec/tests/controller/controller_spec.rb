require 'spec_helper'

#
# cloud::compute::controller
#

describe service('nova-api') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8773) do
  it { should be_listening.with('tcp') }
end

describe port(8774) do
  it { should be_listening.with('tcp') }
end

describe port(8775) do
  it { should be_listening.with('tcp') }
end

describe file('/etc/nova/nova.conf') do
  it { should contain "servicegroup_driver=mc" }
end

describe service('nova-cert') do
  it { should be_enabled }
  it { should be_running }
end

describe service('nova-conductor') do
  it { should be_enabled }
  it { should be_running }
end

describe service('nova-consoleauth') do
  it { should be_enabled }
  it { should be_running }
end

describe service('nova-novncproxy') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6080) do
  it { should be_listening.with('tcp') }
end

describe service('nova-scheduler') do
  it { should be_enabled }
  it { should be_running }
end

describe service('nova-spicehtml5proxy') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6082) do
  it { should be_listening.with('tcp') }
end