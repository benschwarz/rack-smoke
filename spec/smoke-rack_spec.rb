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
        
        it "should serve using the correct content_type" do
          get "/smoke/github.#{format}"
          last_response.content_type.should include(format)
        end
      end
    end
  end
  
  describe "source requirements" do
    describe "with requirements" do
      before :all do      
        Smoke.source_requirements.stub!(:output).and_return([])
      end
    
      it "should allow source requirements to hit smoke" do
        args = {:username => "frank", :sort_by => "date"}
        Smoke.should_receive(:source_requirements).with(args)
        get '/smoke/source_requirements.xml', args
      end
    
      it "should not allow through abstract querystrings" do
        Smoke.should_not_receive(:source_requirements).with({:abstract => "nasty"})
        get '/smoke/source_requirements.xml', {:abstract => "nasty"}
      end
        
      it "should render a 404 when requirements are not met" do
        get '/smoke/source_requirements.xml'
        last_response.should_not be_ok
      end
    end
  end
  
  describe "without requirements" do
    it "should not receive arguments when it cannot accept them (ArgumentError)"
  end
end
