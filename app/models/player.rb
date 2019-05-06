class Player < ApplicationRecord
  has_many :cards

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
  validates_presence_of :image

  def self.select_by_age(age)
    Player.where(age: age)
  end
  
  def self.avg_age
    self.average :age
  end

  def self.hometowns
    #look at 'collect' and 'select' and 'pluck'
    self.select(:hometown).distinct.pluck(:hometown)
  end

end
