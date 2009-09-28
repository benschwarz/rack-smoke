$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'rack/test'

gem 'smoke', '>= 0.5.13'
require 'smoke'
require 'support/source'
require 'smoke-rack'

set :environment, :test

Spec::Runner.configure do |config|
  
end
