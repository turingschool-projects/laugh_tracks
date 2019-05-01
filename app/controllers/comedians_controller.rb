class ComediansController < ApplicationController
  def index
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    elsif params[:age] == nil
      @comedians = Comedian.all
    end
  end
end
