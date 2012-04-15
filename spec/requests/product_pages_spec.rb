require 'spec_helper'

describe "Product pages" do

	subject { page }

  describe "index" do

  	before do
  		3.times { FactoryGirl.create(:product) }
  		visit products_path
  	end

  	it { should have_title("Les Produits") }
  	it { should have_h1("Les Produits") }


  	describe "pagination" do
  		
  	end

  end

end

