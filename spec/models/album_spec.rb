require 'rails_helper'

RSpec.describe Album, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :track_count}
  it {should belong_to :band}
end
