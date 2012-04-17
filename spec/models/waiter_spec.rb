require "rspec"

describe Waiter do
  before do
    @waiter = Waiter.new(name: "Waiter", email: "waiter@youfood.com", password: "password")
  end
  subject { @waiter }

  it { should respond_to :restaurant }
  it { should respond_to :zone }
  it { should respond_to :push_url }
end
