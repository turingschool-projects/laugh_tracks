require 'rails_helper'

RSpec.describe Televisionspecial, type: :model do
  describe "relationship" do
    it {should belong_to :comedian}
  end
end
