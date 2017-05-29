require 'rails_helper'

RSpec.describe TargetCountry, type: :model do
  let!(:project) { FactoryGirl.create :project }
  let!(:country) { FactoryGirl.create :country }
  let!(:target_country) do
    TargetCountry.create(project: project, country: country)
  end

  describe 'Validations' do
    it { should validate_uniqueness_of(:country_id).scoped_to(:project_id) }
  end

  describe 'Associations' do
    it { should belong_to(:project) }
    it { should belong_to(:country) }
  end
end
