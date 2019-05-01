class ComediansController < ApplicationController

  def index
    @comedians = Comedian.all
  end

  def new
    binding.pry
  end

  def age
    @comedians = Comedian.where(age: params[:age])
  end

end
