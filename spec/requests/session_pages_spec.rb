# encoding: utf-8

require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "Signin page" do
    before { visit signin_path }
    it { should have_selector("img", alt: "Food picture") }
    it { should have_selector("legend", text: "Connexion") }
  end

  describe "Signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Se connecter" }

      it { should_not have_signout_link }
      it { should have_error_message("invalide") }

      describe "error message should disappear" do
        before { visit signin_path }

        it { should_not have_error_message("invalide") }
      end
    end

    describe "with valid information" do
      describe "as director" do
        let(:director) { FactoryGirl.create(:director) }
        before { sign_in director }

        it { should have_signout_link }
        it { should have_selector("h1", text: "Directeur") }
        it { should have_link('Gérer les restaurants') }
        it { should have_link('Gérer les menus') }
        it { should have_link('Gérer les produits') }
        it { should have_link('Voir les statistiques') }
        it { should have_link('Créer un restaurant') }
        it { should have_link('Créer un menu') }
        it { should have_link('Gérer un produit') }

        describe "and then signout" do
          before { click_link "Se déconnecter" }
          it { should have_selector("img", alt: "Food picture") }
          it { should have_selector("legend", text: "Connexion") }
        end
      end

      describe "as a restaurant manager" do
        let(:restaurant_manager) { FactoryGirl.create(:restaurant_manager) }
        before { sign_in restaurant_manager }

        it { should have_signout_link }
        it { should have_selector("h1", text: "Restaurant") }
        it { should have_link('Gérer le personnel') }
        it { should have_link('Gérer la salle') }
        it { should have_link('Créer un nouvel employé') }
        it { should have_link('Gérer les commandes') }
      end
    end
  end
end