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

  describe 'model_methods' do
  let!(:project_ex) { FactoryGirl.create :expired_project }
  let!(:project_dis) { FactoryGirl.create :disabled_project }
  let!(:project_low) { FactoryGirl.create :enabled_unexpired_low_cost_project }
  let!(:project_high) { FactoryGirl.create :enabled_unexpired_high_cost_project }

    describe '::find_project' do
      context 'when given no params' do
        it 'returns an enabled, unexpired project with the highest cost' do
          project = Project.find_project({})
          expect(project).to eq project_high
        end
      end

      describe 'when given a projectid' do
        context "with no add'l params" do
          it 'should return the associated project' do
            project = Project.find_project(projectid: 1)
            expect(project).to eq project
          end
        end
        context "with add'l params" do
          it 'should still return the associated project' do
            project = Project.find_project(projectid: 1, country: 'usa')
            expect(project).to eq project
          end
        end
      end

      context 'when given '
    end
  end
end
