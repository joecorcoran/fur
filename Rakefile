desc 'Build rust lib'
task :compile do
  sh %Q{
cd ./lib/rust/fur
cargo clean
cargo build
  }.strip
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: [:compile, :spec]
