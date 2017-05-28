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

require 'test_helper'

class TargetCountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
