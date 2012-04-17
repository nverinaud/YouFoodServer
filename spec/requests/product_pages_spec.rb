require 'spec_helper'

describe "Product pages" do

	subject { page }

  describe "index" do
  	before do
  		@product = FactoryGirl.create(:product)
  		visit products_path
  	end

  	it { should have_title("Les Produits") }
  	it { should have_h1("Les Produits") }

    it { should have_link(@product.name, href: product_path(@product)) }

  	describe "pagination" do

  		before(:all) { 30.times { FactoryGirl.create(:product) } }
      after(:all)  { 
      	Product.delete_all 
      	Category.delete_all
      }

      let(:first_page) { Product.paginate(page: 1) }
      let(:second_page) { Product.paginate(page: 2) }

      it { should have_link('Next') }
      it { should have_link('2') }

      it "should list the first page of products" do
        first_page.each do |product|
          page.should have_selector('td', text: product.name)
        end
      end

      it "should not list the second page of products" do
        second_page.each do |product|
          page.should_not have_selector('td', text: product.name)
        end
      end
  	end
  end

  describe "show" do
    let(:product) { FactoryGirl.create(:product) }
    before { visit product_path(product) }

    it { should have_title(full_title("Produit | #{product.name}")) }
    it { should have_h1(product.name) }

    it "should redirect if bad product id" do
      get product_path(99999999999999)
      response.should redirect_to(products_path)
    end
  end

  describe "product creation" do
    before { visit new_product_path }

    describe "with invalid information" do

      it "should not create a product" do
        expect { click_button "Submit" }.should_not change(Product, :count)
      end

      describe "error messages" do
        let(:error) { '3 errors' }
        before { click_button "Submit" }
        it { should have_content(error) }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'product[price]',     with: "10"
        fill_in 'product[name]' ,     with: "Sample Product"
        fill_in 'product[category]',  with: "Sample Category"
      end

      it "should create a micropost" do
        expect { click_button "Submit" }.should change(Product, :count).by(1)
      end
    end

  end

end

