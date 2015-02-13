require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('arch.yml')

desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'

namespace :serverspec do
  task :all => properties.keys.map {|key| 'serverspec:' + key.split('.')[0] }
  properties.keys.each do |key|
  desc "Run serverspec to #{key}"
    RSpec::Core::RakeTask.new(key.split('.')[0].to_sym) do |t|
      t.pattern = 'spec/{' + properties[key][:roles].join(',') + '}/*_spec.rb'
      ENV['TARGET_HOST'] = key
#      t.rspec_opts += "-r rspec-extra-formatters -f JUnitFormatter -o serverspec-#{key}.xml"
    end
  end
end
