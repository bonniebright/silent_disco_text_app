class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
  end

  def new
    @text = Text.new
    @recipient = Recipient.new
    @recipients = Recipient.all
    @text.recipients.build
  end



  def create
    @text = Text.new(texts_params)
    if @text.save
      flash[:notice] = "text sent!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  # def destroy
  #   @text = Text.find(params[:id])
  #   @text.destroy
  #   redirect_to(root_path)
  # end

private

  def texts_params
    params.require(:text).permit(:to, :from, :body, :text_id, :text_ids, :recipient_ids => [])
  end

end
