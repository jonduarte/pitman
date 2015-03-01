require 'cutest'
require File.expand_path("../lib/pitman", __FILE__)

$VERBOSE = true

task :test do
  Cutest.run(Dir["test/*.rb"])
end

task :default => :test
