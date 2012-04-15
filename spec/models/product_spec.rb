# == Schema Information
#
# Table name: products
#
#  id           :integer         not null, primary key
#  price        :decimal(, )
#  name         :string(255)
#  abbreviation :string(255)
#  description  :text
#  photoURL     :string(255)
#  permanent    :boolean
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe Product do

	before { @product = FactoryGirl.create(:product) }

	subject { @product }

	it { should respond_to(:price) }
	it { should respond_to(:name) }
	it { should respond_to(:abbreviation) }
	it { should respond_to(:description) }
	it { should respond_to(:photoURL) }
	it { should respond_to(:permanent) }

	it { should be_valid }

	describe "with no price" do
		before { @product.price = 0 }
		it { should_not be_valid }
	end

	describe "with no name" do
		before { @product.name = " " }
		it { should_not be_valid }
	end

	describe "with too long abbreviation" do
		before {@product.abbreviation = "a" * 11}
		it { should_not be_valid }
	end

end
