task :compile do
  rust_dir = 'lib/fur/core/rust'
  include_dir = 'lib/fur/core/include'
  Dir["#{rust_dir}/**/*.rs"].each do |lib|
    sh "rustc #{lib} --crate-type=dylib --out-dir=#{include_dir}"
  end
end

task default: :compile
