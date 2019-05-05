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

  def create
    Comedian.create(comedian_params)
    
    redirect_to '/comedians'
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :city, :image)
  end
end
