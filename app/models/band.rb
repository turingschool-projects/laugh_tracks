class Band < ApplicationRecord
  validates_presence_of :name, :city, :age
  has_many :albums

end
