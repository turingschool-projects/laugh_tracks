# spec/models/special_spec.rb

require "rails_helper"

describe Special, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:run_time)}
    it {should validate_presence_of(:comedian_id)}
  end

  describe 'relationships' do
    it { should belong_to :comedian }
  end
  
end
