require "rails_helper"

RSpec.describe Special, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :time }
  end

  describe "relationship" do
    it { should belong_to :comedians }
  end
end