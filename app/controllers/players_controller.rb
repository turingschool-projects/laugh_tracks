class PlayersController < ApplicationController
  
  def index
    @players =  params[:age] ? Player.where(age: params[:age]) : Player.all
  end

  def new
  end

  def create
    player = Player.new(player_params)
    player.save
    redirect_to '/players'
  end

  private 
  def  player_params
    params.require(:player).permit(:name, :age, :hometown, :image)
    #params.require(:player).permit(:age)
    #1params.require(:player).permit(  
  end
end
