# == Schema Information
#
# Table name: target_countries
#
#  id         :integer          not null, primary key
#  project_id :integer
#  country_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TargetCountry < ApplicationRecord
  validates :country, uniqueness: { scope: :project }

  belongs_to :project
  belongs_to :country
end
