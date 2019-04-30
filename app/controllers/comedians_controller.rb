class ComediansController < ApplicationController
  def index
  end

  def show
    @comedian = Comedians.find_all(params[:age])
  end

end
