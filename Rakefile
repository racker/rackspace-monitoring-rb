# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "rackspace-monitoring"
  gem.homepage = "http://github.com/racker/rackspace-monitoring-rb"
  gem.license = "APACHE"
  gem.summary = %Q{Rackspace Cloud Monitoring Ruby Bindings}
  gem.description = %Q{Rackspace Cloud Monitoring Ruby Bindings, built on top of fog.}
  gem.email = "dan.dispaltro@gmail.com"
  gem.authors = ["Dan Di Spaltro"]
  gem.post_install_message = %Q{
 **** PLEASE NOTE *************************************************************
 * 
 *  #{gem.name} has been deprecated. Please consider using fog for all new
 *  projects (http://github.com/fog/fog). The functionality this gem offered is
 *  available in fog as of version 1.15.0.
 *  
 ******************************************************************************
 }
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rackspace-monitoring #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
