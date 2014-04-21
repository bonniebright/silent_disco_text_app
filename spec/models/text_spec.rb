require 'spec_helper'

describe Text, :vcr => true do
  it "doesn't save the text if twilio gives an error" do
    text = Text.new(:body => 'hi', :to => '1111111', :from => '5005550006')
    text.save.should be_false
  end
  it 'adds an error if the to number is invalid' do
     text = Text.new(:body => 'hi', :to => '1111111', :from => '5005550006')
     text.save
     text.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
  it "auto adds the from field with the current user's number" do
    text = Text.new(:body => 'hi', :to => '1111111', :from => '5034054073')
    text.save
    text.from.should eq '5034054073'
  end
end
