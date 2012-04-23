# encoding: utf-8

require 'spec_helper'

describe "Menus" do

  subject { page }

  describe "List page" do

    it { should have_title "YouFood - Portail de gestion - Les menus" }

    it { should have_selector("h1", text: "Les menus") }
    it { should have_selector("input", text: "Nouveau menu") }
    it { should have_selector("th", text: "Titre") }
    it { should have_selector("th", text: "Nombre de produit") }
    it { should have_selector("th", text: "Planification") }

    describe "pagination" do
      before { 100.times { FactoryGirl.create(:menu) } }

      let(:first_page) { user.microposts.paginate(page: 1) }
      let(:second_page) { user.microposts.paginate(page: 2) }

      it { should have_link('Suivant') }
      it { should have_link('2') }

      it "should list the first page of menus" do
        first_page.each do |menu|
          page.should have_link(menu.name)
          page.should have_selector("tr", text: menu.products.count)
        end
      end

      it "should not list the second page of menus" do
        second_page.each do |menu|
          page.should_not have_link(menu.name)
          page.should_not have_selector("tr", text: menu.products.count)
        end
      end

    end
  end
end
