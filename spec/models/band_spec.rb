require 'rails_helper'

RSpec.describe Band, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :city}
end
