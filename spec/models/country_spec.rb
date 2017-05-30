require 'rails_helper'

RSpec.describe Country, type: :model do
  let!(:country) { FactoryGirl.create :country }

  describe 'Validations' do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'Associations' do
    it { should have_many(:target_countries) }
  end
end
