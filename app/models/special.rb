class Special < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :time
end
