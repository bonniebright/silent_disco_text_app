class Text < ActiveRecord::Base
  before_create :send_text
  has_and_belongs_to_many :recipients
  accepts_nested_attributes_for :recipients

private

 def send_text
    recipient_ids.each do |recipient_id|
      begin
      recipient = Recipient.find(recipient_id)

      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :To => recipient.phone,
                      :From => from }
      ).execute

      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end
  end
end
