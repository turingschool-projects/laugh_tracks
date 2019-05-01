# app/models/special.rb

class Special < ApplicationRecord
  validates_presence_of :name, :run_time, :comedian_id
end
