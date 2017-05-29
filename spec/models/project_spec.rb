require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:project) { FactoryGirl.create :project }

  describe 'Validations' do
    it { should validate_presence_of(:id) }
    it { should validate_presence_of(:project_name) }
    it { should validate_presence_of(:project_cost) }
    it { should validate_presence_of(:project_url) }

    it { should validate_uniqueness_of(:id) }
    it { should validate_uniqueness_of(:project_name) }

    it "should validate format of dates"

    # Active Record automatically type casts all input so that it
    # matches the database schema. Because of this, a boolean test is
    # not included since it will always pass.

    it { should validate_numericality_of(:id).only_integer }
    it { should validate_numericality_of(:project_cost) }
  end

  describe 'Associations' do
    it { should have_many(:target_countries) }
    it { should have_many(:countries) }
    it { should have_many(:target_keys) }
    it { should have_many(:keys) }
  end
end
