class ComediansController < ApplicationController
  def index
    if params[:age] == nil
      @comedians = Comedian.all
    else
      @comedians = Comedian.by_age(params[:age])
    end
  end

  def new
    @comedian = Comedian.new
  end
end
