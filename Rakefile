desc 'Build rust lib'
task :compile do
  system 'tt -o ./lib/fur/parser.rb ./lib/fur/fur.treetop'
  system 'cd ./lib/rust/fur && cargo clean && cargo build'
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: [:compile, :spec]
