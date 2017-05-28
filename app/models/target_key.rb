# == Schema Information
#
# Table name: target_keys
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  key_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TargetKey < ApplicationRecord
  validates :key, uniqueness: { scope: :project }

  belongs_to :project
  belongs_to :key
end
