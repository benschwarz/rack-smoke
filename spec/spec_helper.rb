unless defined? SPEC_DIR 
  SPEC_DIR = File.join(File.dirname(__FILE__))
end

require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'rack/test'

require 'smoke'

# The source must be required before rack-smoke
require "#{SPEC_DIR}/support/source"
require File.join(File.dirname(__FILE__), '..', 'lib', 'rack', 'smoke')

set :environment, :test

Spec::Runner.configure do |config|
  
end
