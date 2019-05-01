require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'relationships' do
    it { should have_many :televisionspecials }
  end
end
