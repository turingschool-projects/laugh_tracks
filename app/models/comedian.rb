#app/models/comedian.rb

class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :city 
end
