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
  
	before { @category = Category.new(name: "Boissons") }

	subject { @category } 

	it { should respond_to(:name) }
	it { should respond_to(:products) }

	it { should be_valid }

	describe "with no name" do
		before { @category.name = " " }
		it { should_not be_valid }
	end

	describe "when the name is already taken" do
		before do
			another_category = @category.dup
			another_category.name = @category.name.upcase
			another_category.save
		end
		it { should_not be_valid }
	end

end
