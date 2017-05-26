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
  validates :project_id,
    :project_name,
    :enabled,
    :project_cost,
    :project_url,
    presence: true

  validates :project_id, :project_name, :project_url, uniqueness: true
  validates :creation_date, :expiry_date, date: true
  validates :enabled, inclusion: { in: [true, false],
    message: "must be a boolean" }
  validates :project_id, numericality: { only_integer: true }
end
