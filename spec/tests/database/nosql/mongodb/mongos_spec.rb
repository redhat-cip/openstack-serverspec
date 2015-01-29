require 'spec_helper'
#
# cloud::database::nosql::mongodb::mongos
#

describe port(27017) do
  it { should be_listening }
end

