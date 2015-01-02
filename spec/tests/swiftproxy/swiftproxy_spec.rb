require 'spec_helper'

#################################
#
#         Swift API
#
#################################

describe port(8080) do
  it { should be_listening.with('tcp') }
end
