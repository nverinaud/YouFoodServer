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
      before {
        sign_in manager
        visit zones_path
      }

      it { should have_link("Nouvelle zone") }

      describe "pagination" do
        before {
          30.times { FactoryGirl.create(:zones) }
          visit restaurants_path
        }

        it { should have_selector("th", text: "Nom") }
        it { should have_selector("th", text: "Nombre de tables") }

        let(:first_page) { Menu.paginate(page: 1) }
        let(:second_page) { Menu.paginate(page: 2) }

        it { should have_link('Suivant') }
        it { should have_link('2') }

        it "should list the first page of zones" do
          first_page.each do |zone|
            page.should have_link(zone.name)
          end
        end

        it "should not list the second page of zones" do
          second_page.each do |zone|
            page.should_not have_link(zone.name)
          end
        end
      end
    end
  end
end