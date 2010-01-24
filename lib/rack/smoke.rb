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
      @sources = ::Smoke.exposed_sources.keys
      haml :index
    end
    
    get "/smoke/:source" do 
      raise Sinatra::NotFound if ::Smoke[params["source"].to_sym].nil?
      @source = ::Smoke[params["source"].to_sym]
      haml :usage
    end
    
    get "/smoke/:source/:format" do
      raise Sinatra::NotFound if ::Smoke[params["source"].to_sym].nil?

      format = params.delete("format").to_sym
      content_type format rescue status 400
      
      begin
        name = params.delete("source").to_sym
        output = ::Smoke.__send__(name, params).output(format)
        etag Digest::MD5.hexdigest(output)
        output
      rescue ::Smoke::Origin::UnavailableFormat, NameError  # Requirements not met for source
        status 400
      end
    end
  end
end
