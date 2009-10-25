unless defined? SPEC_DIR 
  SPEC_DIR = File.join(File.dirname(__FILE__))
end

require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'rack/test'

gem 'smoke', '>= 0.5.16'
require 'smoke'
require "#{SPEC_DIR}/support/source"
require File.join(File.dirname(__FILE__), '..', 'lib', 'rack', 'smoke')

set :environment, :test

Spec::Runner.configure do |config|
  
end
