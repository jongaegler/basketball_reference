require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/*.rb']
end

desc "Run Tests"
task :default => :test
