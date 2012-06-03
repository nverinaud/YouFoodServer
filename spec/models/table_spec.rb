# == Schema Information
#
# Table name: tables
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  forks_nb      :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  restaurant_id :integer
#  zone_id       :integer
#

require "rspec"

describe Table do
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  before do
    @table = FactoryGirl.create(:table, zone: FactoryGirl.create(:restaurant), restaurant: :restaurant)
  end

  subject { @table }

  it { should respond_to(:name) }
  it { should respond_to(:forks_nb) }
  it { should respond_to(:restaurant) }
  it { should respond_to(:zone) }
  it { should respond_to(:invoices) }

  it { should be_valid }

  describe "With an empty zone" do
    before do
      @table.zone = nil
    end
    it { should_not be_valid }
  end

  describe "With an emtpy restaurant" do
    before do
      @table.restaurant = nil
    end
    it { should_not be_valid }
  end
end
