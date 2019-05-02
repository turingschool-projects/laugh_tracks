class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
    # @specials = Special.all
  end
  #
  # def show
  #   @comedian = Comedians.find_all(params[:age])
  # end

end
