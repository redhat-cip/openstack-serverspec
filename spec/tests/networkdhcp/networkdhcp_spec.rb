require 'spec_helper'

describe file('/etc/neutron/dhcp_agent.ini') do
  its(:content) { should match /^enable_isolated_metadata ?= ?True$/ }
end
