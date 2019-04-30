class Comedian < ApplicationRecord

  def specials
    Special.select{|special|special.comedian_id == id}.map(&:name)
  end
end
