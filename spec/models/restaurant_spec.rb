require "rspec"

describe Restaurant do
  before do
    @restaurant = Restaurant.new
  end

  it { should respond_to :manager }
  it { should respond_to :zones }
  it { should respond_to :tables }
  it { should respond_to :invoices }
  it { should respond_to :waiters }
  it { should respond_to :cookers }

  it { should be_valid }

end
