# Just here to test easily

# Ensure your sources (and smoke) are required before smoke-rack
require 'examples/smoke-source'
require 'lib/rack/smoke'
use Rack::Smoke

run Sinatra::Application
get '/' do
  "XYZ"
end