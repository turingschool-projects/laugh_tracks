class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :birthplace
  validates_presence_of :image_url

  def self.ages
    order(:age).pluck(:age).uniq
  end

  def special_count
    specials.count
  end

  def self.average_age
    average(:age)
  end
end
