require "rspec"

describe Zone do
  before do
    @zone = FactoryGirl.create(:zones)
  end

  subject { @zone }

  it { should respond_to :name }
  it { should respond_to :restaurant }
  it { should respond_to :waiter }
  it { should respond_to :tables }

  it { should be_valid }

  describe "empty name" do
    before { @zone.name= " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      zone_with_same_name = @zone.dup
      zone_with_same_name.save
    end
    it { should_not be_valid }
  end

  describe "empty restaurant" do
    before { @zone.restaurant = nil }
    it { should_not be_valid }
  end

  describe "empty waiter" do
    before { @zone.waiter = nil }
    it { should_not be_valid }
  end
end
