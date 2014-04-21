class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
  end

  def new
    @text = Text.new
  end

  # def edit
  #   @text = Text.find(params[:id])
  # end

  # def update
  #   @text = Text.find(params[:id])
  #   if params[:text]
  #     @text.update(texts_params)
  #   end
  #   redirect_to text_path
  # end

  def create
    @text = Text.new(texts_params)
    if @text.save
      flash[:notice] = "text sent!"
      redirect_to user_path(@text.user)
      end
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
    params.require(:text).permit(:to, :from, :body, :status)
  end
end

end
