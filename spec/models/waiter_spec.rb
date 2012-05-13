# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  email           :string(255)
#  type            :string(255)
#  name            :string(255)
#  phone           :string(255)
#  address         :string(255)
#  zipCode         :integer
#  city            :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  push_url        :string(255)
#  restaurant_id   :integer
#

require "rspec"

describe Waiter do
  before do
    @waiter = FactoryGirl.create(:waiter)
  end
  subject { @waiter }

  it { should respond_to :restaurant }
  it { should respond_to :zones }
  it { should respond_to :push_url }

  it { should be_valid }

  describe "empty restaurant" do
    before { @waiter.restaurant = nil }
    it { should_not be_valid }
  end

end
