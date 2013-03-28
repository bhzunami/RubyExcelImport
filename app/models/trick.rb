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

  validates :title, uniqueness: { case_sensitive: true }

  def self.import(file)
  	f = open_file file
  	header = f.row(1)

  	(2..f.last_row).each do |i|
  		t = self.new Hash[[header, f.row(i)].transpose]
  		t.save! if t.valid?
  	end
  end

  private

  	def self.open_file(file)
  		case File.extname(file.original_filename)
  		when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
  		when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
  		when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
  		else raise "Pfiiflichopf!!"
  		end
  	end

end
