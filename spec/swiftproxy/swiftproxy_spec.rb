require 'spec_helper'

#################################
#
#         Swift API
#
#################################

describe service('swift-proxy') do
  it { should be_enabled }
  it { should be_running }
end
