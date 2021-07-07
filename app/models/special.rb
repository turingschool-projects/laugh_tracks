class Special < ApplicationRecord
  belongs_to :comedian

  validates_presence_of :name, :runtime, :thumb_url
end
