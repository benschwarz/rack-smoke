require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SmokeRack" do
  include Rack::Test::Methods

  def app
    Smoke::Rack
  end
    
  it "renders the index" do
    get '/smoke'
    last_response.should be_ok
  end
  
  it "should list the sources" do
    get '/smoke'
    last_response.body.should include "<a href=\"/smoke/github\">github</a>"
  end
  
  describe "github source" do
    it "should be okay" do
      get '/smoke/github'
      last_response.should be_ok
    end
    
    describe "formats" do
      %w(json yaml xml).each do |format|
        it "should be okay serving #{format}" do
          get "/smoke/github.#{format}"
          last_response.should be_ok
        end
      end
    end
  end
end
