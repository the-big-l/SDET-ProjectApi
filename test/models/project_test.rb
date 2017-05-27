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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
