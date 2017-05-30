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
    :project_cost,
    :project_url,
    presence: true

  validates :id, :project_name, uniqueness: true
  validates :creation_date, :expiry_date, date: true
  validates :enabled, inclusion: { in: [true, false],
    message: "must be a boolean" }
  validates :id, numericality: { only_integer: true }
  validates :project_cost, numericality: true

  has_many :target_countries
  has_many :countries,
    through: :target_countries

  has_many :target_keys
  has_many :keys,
    through: :target_keys

  def self.find_project(params)
    return Project.return_project(params[:projectid]) if params[:projectid]
    projects = Project.all
      .order(project_cost: :desc)
      .includes(:countries, :keys)
      .where(enabled: true)
      .where.not(project_url: nil)
      .where("DATE(expiry_date) >= ?", Date.today)
    projects = projects.where(countries: { name: params[:country] }) if params[:country]
    projects = projects.where(keys: { keyword: params[:keyword] }) if params[:keyword]
    projects = projects.joins(:keys).where("keys.number >= ?", params[:number]) if params[:number]
    Project.return_project(projects.first)
  end

  def self.return_project(id)
    Project.includes(:countries, :keys).find_by_id(id)
  end
end
