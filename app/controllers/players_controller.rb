class PlayersController < ApplicationController
  
  def index
    @players =  params[:age] ? Player.where(age: params[:age]) : Player.all
  end

end
