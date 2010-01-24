# Just here to test easily

# Ensure your sources (and smoke) are required before rack-smoke
require 'examples/smoke-source'
require 'lib/rack/smoke'
run Rack::Smoke
