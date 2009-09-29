# Just here to test easily

# Ensure your sources (and smoke) are required before smoke-rack
require 'examples/smoke-source'
require 'lib/smoke-rack'
use Smoke::Rack

run Sinatra::Application
get '/' do
  "XYZ"
end