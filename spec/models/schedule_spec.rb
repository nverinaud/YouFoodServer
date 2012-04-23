require "rspec"

describe Schedule do
  before do
    @schedule = Schedule.new
  end
  subject { @schedule }

  it { should respond_to :week }
  it { should respond_to :start_date }
  it { should respond_to :end_date }
  it { should respond_to :menu }

end
