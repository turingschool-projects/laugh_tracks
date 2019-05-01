class ComediansController < ApplicationController

  def index
    @comedians = Comedian.all
  end

  def sort_age
    @comedians = Comedian.where(age: params[:age])
  end
end
