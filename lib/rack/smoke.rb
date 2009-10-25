require 'sinatra'
require 'haml'
require 'md5'

module Rack
  class Smoke < Sinatra::Base  
    set :root, "#{::File.dirname(__FILE__)}/../../"
    set :haml, {:format => :html5, :attr_wrapper => '"'}
    enable :static
    
    mime :xml,  "application/xml"
    mime :json, "application/json"
    mime :yaml, "application/x-yaml"
    
    get "/smoke" do
      @sources = ::Smoke.active_sources.keys
      haml :index
    end
    
    ::Smoke.active_sources.keys.each do |source|
      get "/smoke/#{source.to_s}" do
        @source = source
        haml :usage
      end
      
      get "/smoke/#{source.to_s}.:format" do
        format = params[:format].to_sym
        output = ::Smoke.send(source).output(format)
        
        content_type format
        etag Digest::MD5.hexdigest(output)
        
        output
      end
    end
  end
end
