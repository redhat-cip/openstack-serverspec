require 'spec_helper'
#
# cloud::database::nosql::mongodb::mongod
#

# Since mongod could be run in three different modes:
# 
#  * Normal listening on 27017
#  * Shardsvr listening on 27018
#  * Confisvr listening on 27019
#
# We make sure the mongod process is running and not
# which port it is listening on

describe process('mongod') do
  it { should be_running }
end

describe port(27017) do
  it { should be_listening.with('tcp') }
end
