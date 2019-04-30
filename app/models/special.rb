class Special < ApplicationRecord
  belongs_to :comedian

  validates_presence_of :name
  validates_presence_of :runtime_mins
  validates_presence_of :image_url
end
