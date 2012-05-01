# == Schema Information
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  price              :decimal(, )
#  name               :string(255)
#  abbreviation       :string(255)
#  description        :text
#  permanent          :boolean
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  category_id        :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'spec_helper'

describe Product do

	let(:category) { FactoryGirl.create(:category) }
	before { 
		@product = FactoryGirl.create(:product) 
		@product.category = category
	}

	subject { @product }

	it { should respond_to(:price) }
	it { should respond_to(:name) }
	it { should respond_to(:abbreviation) }
	it { should respond_to(:description) }
	it { should respond_to(:photo) }
	it { should respond_to(:permanent) }
	it { should respond_to(:category) }
  it { should respond_to(:menus)}
	its(:category) { should == category }

	it { should be_valid }

	describe "with no category" do
		before { @product.category = nil }
		it { should_not be_valid }
	end

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
