class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all if params[:age] == nil
    @comedians = Comedian.by_age(params[:age]) if params[:age] != nil
  end
end
