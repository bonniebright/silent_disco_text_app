class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
  end

  def new
    @text = Text.new
    @address = Address.new
    @addresses = Address.all
  end



  def create
    @text = Text.create(texts_params)
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
    params.require(:text).permit(:to, :from, :body)
  end

end
