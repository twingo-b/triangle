task :default => [:spec]
begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop)
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = ['-c']
  end
end
