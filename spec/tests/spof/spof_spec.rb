require 'spec_helper'

#
# cloud::spof
#

describe command("crm_mon -1 | grep ceilometer-agent-central") do
  it { should return_exit_status 0 }
end

# NTP is needed to synchronize the cluster
# using 'ntpstat' command
# Note: ntpstat is not yet present in Debian official repositories.
# https://ftp-master.debian.org/new/ntpstat_0.0.0.1-1.html
# exit status 0 - Clock is synchronised.
# exit status 1 - Clock is not synchronised.
# exit status 2 - If clock state is indeterminant, for example if ntpd is not contactable
describe command("ntpstat") do
  it { should return_exit_status 0 }
end
