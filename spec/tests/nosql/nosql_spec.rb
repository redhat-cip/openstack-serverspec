require 'spec_helper'

#################################
#
#         NON-OPENSTACK
#
#################################

# MongoDB : Ensure the MongoDB installation went smoothly
# 
# To ensure installation is correct the following
# conditions needs to be met :
#
# * service has to be listening on port '27017' and '28017'
#

describe port(27017) do
  it { should be_listening.with('tcp') }
end

describe port(28017) do
  it { should be_listening.with('tcp') }
end
