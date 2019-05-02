class Comedian < ApplicationRecord
  has_many :televisionspecials

  def self.age_average
    average(:age)
  end

  def self.city_unique
    select(:city).distinct
  end
end
