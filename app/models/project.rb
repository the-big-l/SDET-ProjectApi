# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
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
  validates :id,
    :project_name,
    :enabled,
    :project_cost,
    :project_url,
    presence: true

  validates :id, :project_name, uniqueness: true
  validates :creation_date, :expiry_date, date: true
  validates :enabled, inclusion: { in: [true, false],
    message: "must be a boolean" }
  validates :id, numericality: { only_integer: true }

  has_many :target_countries
  has_many :countries,
    through: :target_countries
end
