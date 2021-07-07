class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :birthplace
  validates_presence_of :thumb_url


  def specials_count
    specials.count
  end

  def self.average_age
    Comedian.average(:age).round(2)
  end

end
