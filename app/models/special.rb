class Special < ApplicationRecord
  belongs_to :comedian
  validates_presence_of :name
end
