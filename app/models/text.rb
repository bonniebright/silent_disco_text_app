class Text < ActiveRecord::Base
  before_create :send_text

private

  def send_text
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC3e0af22b6b772460f352ba8c6586fbde/Messages.json',
      :user => 'AC673877ec9938c5a47f32e232cdbc13b3',
      :password => '17ebd2e629391672b185b72cd0e051b1',
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  end
end
end
