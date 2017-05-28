# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  number     :float            not null
#  keyword    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Key < ApplicationRecord
  validates :number, :keyword, presence: true, uniqueness: true

  has_many :target_keys
end
