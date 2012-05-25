# == Schema Information
#
# Table name: invoices
#
#  id         :integer         not null, primary key
#  price      :decimal(, )
#  state      :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  table_id   :integer
#

class Invoice < ActiveRecord::Base
  attr_accessible :price, :state

  has_and_belongs_to_many :products
  belongs_to :table
end
