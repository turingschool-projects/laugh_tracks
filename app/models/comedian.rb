class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name,
                        :age,
                        :city,
                        :image_url

  def self.comedian_age(age)
    Comedian.where(age: age)
  end

end
