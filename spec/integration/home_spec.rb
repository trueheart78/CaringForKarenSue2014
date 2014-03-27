require 'spec_helper'

describe "Caring For Caring Sue" do
  it "should show the correct header on the home page" do
  	get '/'
  	expect(last_response).to be_ok
  	expect(last_response.body).to match(/5th Annual Caring for Karen Sue/)
  end
  it "should display the start time on the home page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Saturday, Sept 13, 2014/)
  end
  it "should respond to GET /join" do
  	get '/join'
  	expect(last_response).to be_ok
  	expect(last_response.body).to match(/Register to Play/)
  end
  it "should respond to GET /about" do
  	get '/about'
  	expect(last_response).to be_ok
  	expect(last_response.body).to match(/In 2009, our mom, Karen Danielson/)
  end
  #it "should redirect to POST without param" do
  #	post '/surnames'
  #	expect(last_response).to_not be_ok
  #end
end