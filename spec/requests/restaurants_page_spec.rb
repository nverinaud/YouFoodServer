# encoding: utf-8

require 'spec_helper'

describe "Restaurants" do

  subject { page }

  describe "List all the restaurants" do

    describe "When not signed in as director" do
      before { visit restaurants_path }

      it { should_not have_title "YouFood | Portail directeur | Les restaurants" }
      it { should_not have_selector("h1", text: "Les restaurants") }
    end

    describe "When signed in as director" do
      let(:director) { FactoryGirl.create(:director) }
      before {
        sign_in director
        visit restaurants_path
      }


      it { should have_link("Nouveau restaurant") }

      describe "pagination" do
        before {
          100.times { FactoryGirl.create(:restaurant) }
          visit restaurants_path
        }

        it { should have_selector("th", text: "Nom") }
        it { should have_selector("th", text: "Gérant") }
        it { should have_selector("th", text: "Ville") }
        it { should have_selector("th", text: "Contact") }

        let(:first_page) { Menu.paginate(page: 1) }
        let(:second_page) { Menu.paginate(page: 2) }

        it { should have_link('Suivant') }
        it { should have_link('2') }

        it "should list the first page of restaurants" do
          first_page.each do |restaurant|
            page.should have_link(restaurant.name)
          end
        end

        it "should not list the second page of menus" do
          second_page.each do |restaurant|
            page.should_not have_link(restaurant.name)
          end
        end
      end
    end
  end

  describe "Show one restaurant page" do
    let(:restaurant) { FactoryGirl.create(:restaurant) }

    describe "When not signed in as director" do

      before { visit restaurant_path(restaurant) }

      it { should_not have_title "YouFood | Portail directeur | #{restaurant.name}" }
      it { should_not have_selector("h1", text: "#{restaurant.name}") }
    end

    describe "When signed in as director" do
      let(:director) { FactoryGirl.create(:director) }

      before {
        sign_in director
        visit restaurant_path(restaurant)
      }

      it { should have_title "YouFood | Portail directeur | #{restaurant.name}" }
      it { should have_selector("h1", text: "#{restaurant.name}") }
      it { should have_selector("h3", text: "#{restaurant.restaurant_manager.email}") }

      it { should have_selector("tr", text: "#{restaurant.restaurant_manager.name}") }
      it { should have_selector("tr", text: "#{restaurant.phone}") }
      it { should have_selector("tr", text: "#{restaurant.address} #{restaurant.city}") }
      it { should have_selector("tr", text: "#{restaurant.waiters.count} serveurs") }

      it { should have_link("Statistiques de ce restaurant") }
      it { should have_link("Supprimer") }
      it { should have_link("Modifier") }
    end
  end
end