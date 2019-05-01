class ComediansController < ApplicationController

  def index
    @comedians = Comedian.all
    @specials = Special.all
    @comedians = Comedian.where(age: params[:age]) if params[:age]
  end
end
