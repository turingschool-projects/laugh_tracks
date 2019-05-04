class ComediansController < ApplicationController
  def index
    age = params[:age]
    # binding.pry
    if age.nil?
      @comedians = Comedian.all
    else
      @comedians = Comedian.comedian_age(age)
    end
    @specials = Special.all
  end

  def new
    comedian = Comedian.new
  end

  def create
    comedian = Comedian.create!(comedian_params)
    comedian.save
    redirect_to "/comedians"
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :city)
  end

end
