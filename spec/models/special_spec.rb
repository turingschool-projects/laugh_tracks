require 'rails_helper'

describe Special, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end
end

describe Special do
  describe 'relationship' do
    it { should belong_to :comedian}
  end
end
