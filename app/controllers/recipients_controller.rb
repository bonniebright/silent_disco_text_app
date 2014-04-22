class RecipientsController < ApplicationController

  def index
    @recipients = Recipient.all
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipients_params)
    if @recipient.save
      redirect_to recipients_url
    else
      render 'new'
    end
  end

private

  def recipients_params
    params.require(:recipient).permit(:name, :number, :user_id, :recipient_ids => [], :text_id, :text_ids)
  end
end
