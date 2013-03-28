class Trick < ActiveRecord::Base
  attr_accessible :author, :problem, :solution, :solved_by, :title
end
