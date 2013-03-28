# == Schema Information
# Schema version: 20130328085729
#
# Table name: tricks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  problem    :text
#  solution   :text
#  author     :string(255)
#  solved_by  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trick < ActiveRecord::Base
  attr_accessible :author, :problem, :solution, :solved_by, :title
end
