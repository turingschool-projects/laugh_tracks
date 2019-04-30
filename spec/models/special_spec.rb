require 'rails_helper'

describe Special, type: :model do
  describe "Relationships" do
    it { should belong_to :comedian}
  end
  describe "Validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :runtime_mins}
    it { should validate_presence_of :image_url}
  end
end
