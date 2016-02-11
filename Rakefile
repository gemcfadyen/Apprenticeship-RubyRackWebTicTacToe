begin
  require 'rspec/core/rake_task'
  require 'fileutils'
  ENV['JASMINE_CONFIG_PATH'] = "spec/javascript/support/jasmine.json"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :default => [:spec, :jasmine]

task :jasmine do
  sh 'jasmine'
end
