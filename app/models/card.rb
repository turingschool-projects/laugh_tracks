class Card < ApplicationRecord
  belongs_to :player

  validates_presence_of :name
  validates_presence_of :cost
  validates_presence_of :description
end
