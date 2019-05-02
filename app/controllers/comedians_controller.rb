class ComediansController < ApplicationController
  def index
    # require 'pry'; binding.pry
    age = params[:age].to_s
    if age.empty?
      @comedians = Comedian.all
    else
      @comedians = Comedian.where(age: age)
    end
  end

  def new
    @comedian = Comedian.new
  end

  def create
    comedian = Comedian.new(comedian_params)
    comedian.save
    redirect_to '/comedians'
  end

  private
  def comedian_params
    params.require(:comedian).permit(:name, :age, :city, :imageurl)
  end
end
