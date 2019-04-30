class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
    @specials = Televisionspecial.all
  end
  
end
