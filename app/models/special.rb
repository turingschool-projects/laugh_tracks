class Special < ApplicationRecord
  belongs_to :comedian
  validates_presence_of :name, :runtime_mins


  def self.average_runtime
    Special.average(:runtime_mins)
  end

end
