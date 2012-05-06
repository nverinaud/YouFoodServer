require "rspec"

describe Restaurant do
  before do
    @restaurant = FactoryGirl.create(:restaurant)
  end

  subject { @restaurant }

  it { should respond_to :name }
  it { should respond_to :city }
  it { should respond_to :phone }
  it { should respond_to :address }
  it { should respond_to :manager }
  it { should respond_to :zones }
  it { should respond_to :tables }
  it { should respond_to :invoices }
  it { should respond_to :waiters }
  it { should respond_to :cookers }

  it { should be_valid }

end
