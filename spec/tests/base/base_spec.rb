require 'spec_helper'

#
# cloud::init
#

describe port(22) do
  it { should be_listening.with('tcp') }
end

# test if DNS is working
describe command("timeout 1 dig #{property[:vip_internal_fqdn]}") do
  it { should return_exit_status 0 }
end
