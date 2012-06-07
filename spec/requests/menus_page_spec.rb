# encoding: utf-8

require 'spec_helper'

describe "Menus" do

  let(:director) { FactoryGirl.create(:director) }
  subject { page }

  describe "List all the menus page" do

    describe "When not signed in as director" do
      before { visit menus_path }

      it { should_not have_title "YouFood | Portail directeur | Les menus" }
      it { should_not have_selector("h1", text: "Les menus") }
    end

    describe "When signed in as director" do
      before {
        sign_in director
        visit menus_path
      }


      it { should have_link("Nouveau menu") }

      describe "pagination" do
        before {
          30.times { FactoryGirl.create(:menu) }
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
          end
        end

        it "should not list the second page of menus" do
          second_page.each do |menu|
            page.should_not have_link(menu.name)
          end
        end
      end
    end
  end

  describe "Show one menu page" do
    let(:menu) { FactoryGirl.create(:menu) }

    describe "When not signed in as director" do
      before { visit menu_path(menu) }

      it { should_not have_title "YouFood | Portail directeur | #{menu.name}" }
      it { should_not have_selector("h1", text: "Menu #{menu.name}") }
    end

    describe "When signed in as director" do
      before {
        sign_in director
        visit menu_path(menu)
      }

      it { should have_title "YouFood | Portail directeur | #{menu.name}" }
      it { should have_selector("h1", text: "#{menu.name}") }

      it { should have_selector("tr", text: menu.description) }

      it "should have a list of schedules weeks" do
        menu.schedules.each do |schedule|
          page.should have_selector("li", text: "Semaine #{schedule.week}")
        end
      end

      it "should have a link to each products" do
        menu.products.each do |product|
          page.should have_link(product.name, href: product_path(product))
        end
      end

      it { should have_link("Supprimer") }
      it { should have_link("Modifier") }
    end
  end

  describe "Menu creation" do
    before do
      sign_in director
      visit new_menu_path
    end

    describe "with invalid information" do

      it "should not create a menu" do
        expect { click_button "Valider" }.should_not change(Menu, :count)
      end
    end

    describe "with valid information" do
      before do
        create_valid_menu
      end

      it "should create a menu" do
        expect { click_button "Valider" }.should change(Menu, :count).by(1)
      end
    end
  end
end