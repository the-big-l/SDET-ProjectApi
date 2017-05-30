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

  factory :api_project, class: Project do
    id 2
    projectName 'test project number 2'
    creationDate '05112017 00:00:00'
    expiryDate '05202017 00:00:00'
    enabled true
    projectCost 5.5
    projectUrl 'http://www.unity3d.com'
  end

  factory :expired_project, class: Project do
    id 3
    project_name 'test project number 3'
    creation_date '20170511 00:00:00'
    expiry_date '20160520 00:00:00'
    enabled true
    project_cost 10
    project_url 'http://www.unity3d.com'
  end

  factory :disabled_project, class: Project do
    id 4
    project_name 'test project number 4'
    creation_date '20170511 00:00:00'
    expiry_date '20180520 00:00:00'
    enabled false
    project_cost 10
    project_url 'http://www.unity3d.com'
  end

  factory :enabled_unexpired_low_cost_project, class: Project do
    id 5
    project_name 'test project number 5'
    creation_date '20170511 00:00:00'
    expiry_date '20180520 00:00:00'
    enabled true
    project_cost 5.5
    project_url 'http://www.unity3d.com'
  end

  factory :enabled_unexpired_high_cost_project, class: Project do
    id 6
    project_name 'test project number 6'
    creation_date '20170511 00:00:00'
    expiry_date '20180520 00:00:00'
    enabled true
    project_cost 9.5
    project_url 'http://www.unity3d.com'
  end
end
