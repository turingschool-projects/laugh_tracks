class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :birthplace
  validates_presence_of :image_url

  def special_count
    specials.count
  end

  def self.average_age
    average(:age)
  end

  def self.birthplaces
    order(:birthplace).pluck(:birthplace)
  end

  def self.total_specials
    joins(:specials).count
  end

  def self.average_special_length
    joins(:specials).average(:runtime_mins)
  end

  def self.order_name(order)
    order(name: :"#{order}")
  end

  def self.order_bp(order)
    order(birthplace: :"#{order}")
  end

  def self.order_age(order)
    order(age: :"#{order}")
  end

  def self.available_ages
    order(:age).pluck(:age)
  end
end
