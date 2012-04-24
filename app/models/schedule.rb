class Schedule < ActiveRecord::Base
  attr_accessible :week, :start_date, :end_date
  belongs_to :menu

end
