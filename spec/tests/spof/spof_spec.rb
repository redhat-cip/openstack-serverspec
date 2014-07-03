require 'spec_helper'

#
# cloud::spof
#

describe command("crm_mon -1 | grep ceilometer-agent-central") do
  it { should return_exit_status 0 }
end
