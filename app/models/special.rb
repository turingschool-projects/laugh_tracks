# app/models/special.rb

class Special < ApplicationRecord
  belongs_to :comedian

  validates_presence_of :name, :run_time, :comedian_id
end
