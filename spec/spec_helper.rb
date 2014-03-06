require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS
include Serverspec::Helper::Properties

properties = YAML.load_file('arch.yml')

RSpec.configure do |c|
    c.host  = c.exclusion_filter()[:host]
    set_property properties[c.host]
    options = Net::SSH::Config.for(c.host)
    user = 'root'
    c.ssh   = Net::SSH.start(c.host, user, options)
    c.os    = backend.check_os
end
