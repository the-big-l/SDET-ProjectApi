require 'rails_helper'

RSpec.describe Key, type: :model do
  let!(:key) { FactoryGirl.create :key }

  describe 'Validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:keyword) }

    it { should validate_uniqueness_of(:number).case_insensitive }
    it { should validate_uniqueness_of(:keyword).case_insensitive }
  end

  describe 'Associations' do
    it { should have_many(:target_keys) }
  end
end
