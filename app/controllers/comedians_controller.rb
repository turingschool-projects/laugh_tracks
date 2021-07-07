class ComediansController < ApplicationController
  def index
    if params[:age] != nil
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
  end

  def new
  end

  def create
    Comedian.create(comedian_params)
    redirect_to '/comedians'
  end
#everything above private is "public" and users can access all of it.
  private
  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace, :thumb_url)
  end
end
