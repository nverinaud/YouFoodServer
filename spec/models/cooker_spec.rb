require "rspec"

describe Cooker do
  before do
    @cooker = Cooker.new(name: "Cooker", email: "cooker@youfood.com", password: "password")
  end
  subject { @cooker }

  it { should respond_to :restaurant }
end
