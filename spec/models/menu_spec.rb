# == Schema Information
#
# Table name: menus
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  default     :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require "rspec"

describe Menu do
  before do
    @menu = FactoryGirl.create(:menu)
  end
  subject { @menu }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :schedules }
  it { should respond_to :default }
  it { should respond_to :products }

  it { should be_valid }

  describe "Without name" do
    before { @menu.name = "" }
    it { should_not be_valid }
  end

  describe "Without description" do
    before { @menu.description = "" }
    it { should_not be_valid }
  end
end
