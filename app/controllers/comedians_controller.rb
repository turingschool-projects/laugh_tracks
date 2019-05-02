class ComediansController < ApplicationController

  def index
    @comedians = Comedian.all
    @specials = Special.all
    @comedians = Comedian.where(age: params[:age]) if params[:age]
  end

  def new
  end

  def create
    @comedian = Comedian.new(comedian_params)
    @comedian.save
    redirect_to comedians_path
  end

  private

  def comedian_params
    require "pry"; binding.pry
    params.require(:comedian).permit(:name, :age, :city)
  end
end
