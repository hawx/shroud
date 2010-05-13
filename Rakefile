require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "shroud"
    gemspec.summary = %Q{Ruby wrapper for the CloudApp REST API}
    gemspec.description = %Q{A wrapper for the CloudApp REST API, including a command line executable}
    gemspec.email = "m@hawx.me"
    gemspec.homepage = "http://github/hawx/shroud"
    gemspec.authors = ["Joshua Hawxwell"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end