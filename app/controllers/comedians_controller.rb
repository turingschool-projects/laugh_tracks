class ComediansController < ApplicationController

  def index
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    elsif params[:sort] == "asc"
      @comedians = Comedian.order_name_asc
    elsif params[:sort] == 'desc'
      @comedians = Comedian.order_name_desc
    else
      @comedians = Comedian.all
    end
  end

  def show
    @comedian = Comedian.find(params[:id])
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params)
    redirect_to comedians_path
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace, :image_url)
  end

end
