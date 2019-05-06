class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
    # require 'pry' ;binding.pry
  end
  
end
