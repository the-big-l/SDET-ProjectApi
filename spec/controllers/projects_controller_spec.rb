require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "POST #create" do
    context 'with valid parameters' do
      before(:each) do
        post :create,
          params: FactoryGirl.attributes_for(
            :api_project,
            targetCountries: ['USA', 'BRAZIL'],
            targetKeys: [
              { number: 25, keyword: 'sports' },
              { number: 30, keyword: 'news' }
            ]
          ),
          format: :json
      end

      it { should render_template(:show) }
      it { should respond_with(200) }
      it 'the project persists' do
        expect(Project.exists?).to be true
      end
      it 'includes the right amount of target countries' do
        expect(assigns(:project).countries.count).to be 2
      end
      it 'includes the right amount of target keys' do
        expect(assigns(:project).keys.count).to be 2
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        post :create,
          params: FactoryGirl.attributes_for(
            :api_project,
            creationDate: '',
            targetCountries: ['USA'],
            targetKeys: [{ number: 25, keyword: 'sports' }]
          ),
          format: :json
      end

      it { should respond_with(422) }
      it 'the project does not persist' do
        expect(Project.exists?).to be false
      end
    end

    context 'with duplicate target countries' do
      before(:each) do
        post :create,
          params: FactoryGirl.attributes_for(
            :api_project,
            targetCountries: ['USA', 'USA'],
            targetKeys: [{ number: 25, keyword: 'sports' }]
          ),
          format: :json
      end

      it { should respond_with(422) }
      it 'the project does not persist' do
        expect(Project.exists?).to be false
      end
    end

    context 'with duplicate target keys' do
      before(:each) do
        post :create,
          params: FactoryGirl.attributes_for(
            :api_project,
            targetCountries: ['USA'],
            targetKeys: [
              { number: 25, keyword: 'sports' },
              { number: 25, keyword: 'sports' }
            ]
          ),
          format: :json
      end

      it { should respond_with(422) }
      it 'the project does not persist' do
        expect(Project.exists?).to be false
      end
    end
  end
end
