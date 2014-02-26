require 'spec_helper'
#
# Ceilometer
#
describe command("echo \"db.system.indexes.find()\" | mongo \"#{property[:server_ip]}\":27017/ceilometer") do
  its(:stdout) { should match /"ns" : "ceilometer.resource"/ }
end
