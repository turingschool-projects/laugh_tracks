class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :city
  validates_presence_of :image

  def self.by_age(age)
    Comedian.where(age: age)
  end

  def specials_count
    self.specials.count
  end

  def average_age(age)
    if age != nil
      Comedian.by_age(age).average(:age)
      #can just replace this with age, but this is more accurate on what to do.
    else
      Comedian.average(:age)
    end
  end

  def get_hometowns(age)
    if age != nil
      Comedian.by_age(age).select(:city).distinct
      #can just replace this with age, but this is more accurate on what to do.
    else
      Comedian.select(:city).distinct
    end
  end

  # def get_total_specials(age)
  #   if age != nil
  #     require 'pry'; binding.pry
  #     Comedian.by_age(age).specials.count
  #     #can just replace this with age, but this is more accurate on what to do.
  #   else
  #     Comedian.specials.count
  #   end
  # end
end
