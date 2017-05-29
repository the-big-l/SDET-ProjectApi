require 'rails_helper'

RSpec.describe TargetKey, type: :model do
  let!(:project) { FactoryGirl.create :project }
  let!(:key) { FactoryGirl.create :key }
  let!(:target_key) { TargetKey.create(project: project, key: key) }

  describe 'Validations' do
    it { should validate_uniqueness_of(:key_id).scoped_to(:project_id) }
  end

  describe 'Associations' do
    it { should belong_to(:project) }
    it { should belong_to(:key) }
  end
end
