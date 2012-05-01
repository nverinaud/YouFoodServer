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

class Schedule < ActiveRecord::Base
  attr_accessible :week, :start_date, :end_date
  belongs_to :menu

end
