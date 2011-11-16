# == Schema Information
#
# Table name: prof_stars
#
#  id           :integer         not null, primary key
#  professor_id :integer
#  stars        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

require 'spec_helper'

describe ProfStar do
  pending "add some examples to (or delete) #{__FILE__}"
end
