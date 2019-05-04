class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name,
                        :age,
                        :city

  def self.comedian_age(age)
    Comedian.where(age: age)
  end

  def specials_count
    self.specials.count
  end

  def self.average_age
    Comedian.average(:age).to_i
  end

  def self.unique_cities
    Comedian.distinct.pluck(:city)
  end

end
