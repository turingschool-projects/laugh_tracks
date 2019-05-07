class Album < ApplicationRecord
  belongs_to :band
  validates_presence_of :name, :track_count
end
