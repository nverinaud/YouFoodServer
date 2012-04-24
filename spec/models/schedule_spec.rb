# == Schema Information
#
# Table name: schedules
#
#  id         :integer         not null, primary key
#  week       :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  menu_id    :integer
#

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
