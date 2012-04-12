require 'spec_helper'

describe 'Portal pages' do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_selector("img", alt: "Food picture")}
    it { should have_selector("legend", text: "Connexion")}
  end

end
