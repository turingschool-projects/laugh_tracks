class ComediansController < ApplicationController
  def index
    age = params[:age].to_s
    if age.empty?
      @comedians = Comedian.all
    else
      @comedians = Comedian.where(age: age)
    end
    @specials = Televisionspecial.all
  end
end
