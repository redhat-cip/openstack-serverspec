require 'spec_helper'

#
# cloud::dashboard
#

describe file('/var/log/horizon/horizon.log') do
  it { should be_file }
end

describe command("curl #{property[:server_ip]} | grep 301") do
  it { should return_exit_status 0 }
end
