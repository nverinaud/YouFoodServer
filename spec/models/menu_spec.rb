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