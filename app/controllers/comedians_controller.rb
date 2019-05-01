class ComediansController < ApplicationController

  def index
    @comedians = Comedian.all
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params)
    redirect_to comedians_path
  end

  def age
    @comedians = Comedian.where(age: params[:age])
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace, :image_url)
  end

end
