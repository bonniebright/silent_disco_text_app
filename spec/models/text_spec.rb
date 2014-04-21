require 'spec_helper'

describe Text do
  it "doesn't save the text if twilio gives an error" do
    text = Text.new(:body => 'hi', :to => '1111111', :from => '5005550006')
    text.save.should be_false
  end
end
