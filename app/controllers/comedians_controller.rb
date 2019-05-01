# app/controllers/comedians_controller.rb

class ComediansController < ApplicationController

  def index
    @comedians = Comedian.all
  end

end
