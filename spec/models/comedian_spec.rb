require "rails_helper"

describe Comedian do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many :specials }

  end

end
