class PlayersController < ApplicationController
  
  def index
    @players =  params[:age] ? Player.select_by_age(params[:age]) : Player.all
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.new(player_params)
    player.save
    redirect_to '/players'
  end

  private 
  def  player_params
    params.require(:player).permit(:name, :age, :hometown, :image)
  end

end
