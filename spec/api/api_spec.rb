require 'spec_helper'

#################################
#
#         OpenStack API services
#
#################################

describe service('cinder-api') do
  it { should be_enabled }
  it { should be_running }
end

describe service('cinder-backup') do
  it { should be_enabled }
  it { should be_running }
end

describe service('cinder-scheduler') do
  it { should be_enabled }
  it { should be_running }
end

describe service('cinder-volume') do
  it { should be_enabled }
  it { should be_running }
end

describe service('glance-api') do
  it { should be_enabled }
  it { should be_running }
end

describe service('glance-registry') do
  it { should be_enabled }
  it { should be_running }
end

describe service('heat-api') do
  it { should be_enabled }
  it { should be_running }
end

describe service('heat-api-cfn') do
  it { should be_enabled }
  it { should be_running }
end

describe service('heat-api-cloudwatch') do
  it { should be_enabled }
  it { should be_running }
end

# uncomment when bug 174 is fixed
# describe service('heat-api-engine') do
#   it { should be_enabled }
#   it { should be_running }
# end

describe service('neutron-server') do
  it { should be_enabled }
  it { should be_running }
end

describe service('nova-api') do
  it { should be_enabled }
  it { should be_running }
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

describe service('nova-scheduler') do
  it { should be_enabled }
  it { should be_running }
end
