require 'spec_helper'

describe "Zones" do

  subject { page }

  describe "List all the zones" do

    describe "When not signed in as restaurant manager" do
      before { visit zones_path }

      it { should_not have_title "YouFood | Portail restaurant | La salle" }
      it { should_not have_selector("h1", text: "Les zones") }
    end

    describe "When signed in as restaurant manager" do
      let(:manager) { FactoryGirl.create(:restaurant_manager) }
      let(:restaurant) { FactoryGirl.create(:restaurant, restaurant_manager: manager) }
      before {
        30.times { FactoryGirl.create(:zone, restaurant: restaurant) }
        sign_in restaurant.restaurant_manager
        visit zones_path
      }

      it { should have_link("Nouvelle zone") }
      it { should have_selector("th", text: "Nom") }
      it { should have_selector("th", text: "Nombre de tables") }

    end
  end
end