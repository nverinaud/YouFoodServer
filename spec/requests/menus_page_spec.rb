# encoding: utf-8

require 'spec_helper'

describe "Menus" do

  subject { page }

  describe "List page" do
    before { visit menus_path }

    it { should have_title "YouFood | Portail directeur | Les menus" }

    it { should have_selector("h1", text: "Les menus") }
    it { should have_link("Nouveau menu") }

    describe "pagination" do
      before {
        100.times { FactoryGirl.create(:menu) }
        visit menus_path
      }

      it { should have_selector("th", text: "Nom") }
      it { should have_selector("th", text: "Nombre de produit") }
      it { should have_selector("th", text: "Planification") }

      let(:first_page) { Menu.paginate(page: 1) }
      let(:second_page) { Menu.paginate(page: 2) }

      it { should have_link('Suivant') }
      it { should have_link('2') }

      it "should list the first page of menus" do
        first_page.each do |menu|
          page.should have_link(menu.name)
          page.should have_selector("td", text: menu.products.count)
          page.should have_selector("td", text: "Semaine #{menu.schedules.week}")
        end
      end

      it "should not list the second page of menus" do
        second_page.each do |menu|
          page.should_not have_link(menu.name)
          page.should_not have_selector("td", text: menu.products.count)
          page.should_not have_selector("td", text: "Semaine #{menu.schedules.week}")
        end
      end
    end
  end
end
