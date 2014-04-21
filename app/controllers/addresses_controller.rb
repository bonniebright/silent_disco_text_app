class AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(addresses_params)
    if @address.save
      redirect_to addresses_url
    else
      render 'new'
    end
  end

private

  def addresses_params
    params.require(:address).permit(:name, :number, :user_id)
  end
end
