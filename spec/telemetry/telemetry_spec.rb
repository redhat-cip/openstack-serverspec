require 'spec_helper'
#
# Ceilometer
#
describe command('echo "db.system.indexes.find()" | mongo 127.0.0.1:27017/ceilometer') do
  its(:stdout) { should match /"ns" : "ceilometer.resource"/ }
end
