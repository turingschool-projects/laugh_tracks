# app/models/comedian.rb

class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name, :age, :city

  def self.by_age(age)
    where(age: age.to_i)
  end

end
