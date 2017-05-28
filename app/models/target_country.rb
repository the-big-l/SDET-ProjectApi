class TargetCountry < ApplicationRecord
  validates :country, uniqueness: { scope: :project }

  belongs_to :project
  belongs_to :country
end
