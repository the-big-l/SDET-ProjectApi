FactoryGirl.define do
  factory :project do
    id 1
    project_name 'test project number 1'
    creation_date '20170511 00:00:00'
    expiry_date '20170520 00:00:00'
    enabled true
    project_cost 5.5
    project_url 'http://www.unity3d.com'
  end
end
