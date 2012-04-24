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
    @menu = Menu.new
  end
  subject { @menu }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :schedules }
  it { should respond_to :default }
  it { should respond_to :products }
end
