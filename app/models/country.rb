# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :target_countries

  def name=(val)
    val.nil? ? val : val.downcase!
    write_attribute(:name, val)
  end
end
