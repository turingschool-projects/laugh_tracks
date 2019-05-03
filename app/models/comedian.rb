class Comedian < ApplicationRecord
  has_many :specials

  def specials_count
    specials.count
  end

end
