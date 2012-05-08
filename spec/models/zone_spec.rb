require "rspec"

describe Zone do
  before do
    @zone = Zone.new
  end

  subject { @zone }

  it { should respond_to :name }
  it { should respond_to :restaurant }
  it { should respond_to :waiter }
  it { should respond_to :tables }

  it { should be_valid }
end
