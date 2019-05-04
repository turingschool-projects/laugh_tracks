# app/controllers/comedians_controller.rb

class ComediansController < ApplicationController
  protect_from_forgery with: :exception

  def index
    if params[:age] == nil
      @comedians = Comedian.all
    else
      @comedians = Comedian.by_age(params[:age])
    end
  end

end
