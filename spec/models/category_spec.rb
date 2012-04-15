# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Category do
  
	before { @category = FactoryGirl.create(:category) }

	subject { @category } 

	it { should respond_to(:name) }

	it { should be_valid }

	describe "with no name" do
		before { @category.name = " " }
		it { should_not be_valid }
	end

end
