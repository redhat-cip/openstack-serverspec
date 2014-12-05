require 'spec_helper'

#
# cloud::dashboard
#

describe command("curl -k #{property[:endpoint_protocol]}://#{property[:vip_public]} | grep 301") do
  it { should return_exit_status 0 }
end
