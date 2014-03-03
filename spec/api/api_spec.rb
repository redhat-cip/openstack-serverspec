require 'spec_helper'

#################################
#
#         OpenStack API services
#
#################################

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

describe service('neutron-server') do
  it { should be_enabled }
  it { should be_running }
end

describe service('ceilometer-api') do
  it { should be_enabled }
  it { should be_running }
end

describe service('ceilometer-collector') do
  it { should be_enabled }
  it { should be_running }
end

describe service('ceilometer-alarm-evaluator') do
  it { should be_enabled }
  it { should be_running }
end

describe service('ceilometer-alarm-notifier') do
  it { should be_enabled }
  it { should be_running }
end
