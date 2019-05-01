class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :birthplace
  validates_presence_of :image_url

  def self.available_ages
    order(:age).pluck(:age).uniq
  end
end
