require "rspec"

describe Table do
  before do
    @table = FactoryGirl.create(:table)
  end

  subject { @table }

  it { should respond_to(:name) }
  it { should respond_to(:forks_nb) }
  it { should respond_to(:restaurant) }
  it { should respond_to(:zone) }
  it { should respond_to(:invoices) }

  it { should be_valid }
  
end