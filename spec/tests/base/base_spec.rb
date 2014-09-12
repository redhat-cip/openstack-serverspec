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

# test if NTP is working
# using 'ntpstat' command
# exit status 0 - Clock is synchronised.
# exit status 1 - Clock is not synchronised.
# exit status 2 - If clock state is indeterminant, for example if ntpd is not contactable
describe command("ntpstat") do
  it { should return_exit_status 0 }
end
