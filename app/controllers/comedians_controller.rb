class ComediansController < ApplicationController
  def index
    age = params[:age]
    if age.nil?
      @comedians = Comedian.all
    else
      # binding.pry
      @comedians = Comedian.comedian_age(age)
    end
    @specials = Special.all
  end

end
