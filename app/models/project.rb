# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  project_id    :integer
#  project_name  :string
#  creation_date :datetime
#  expiry_date   :datetime
#  enabled       :boolean
#  project_cost  :float
#  project_url   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Project < ApplicationRecord
end
