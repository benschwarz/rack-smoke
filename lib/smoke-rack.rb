require 'sinatra'

module Smoke
  class Rack < Sinatra::Base    
    set :public, File.join(File.dirname(__FILE__), '..', 'public')
    set :views, File.join(File.dirname(__FILE__), '..', 'views')
    set :haml, {:format => :html5, :attr_wrapper => '"'}
    enable :static
    
    mime :xml,  "application/xml"
    mime :json, "application/json"
    mime :yaml, "application/x-yaml"
    
    get '/smoke' do
      @sources = Smoke.active_sources.keys
      haml :index
    end
    
    Smoke.active_sources.keys.each do |source|
      get "/smoke/#{source.to_s}" do
        @source = source
        haml :usage
      end
      
      get "/smoke/#{source.to_s}.:format" do
        format = params[:format].to_sym
        
        content_type format
        Smoke.send(source).output(format)
      end
    end
  end
end
