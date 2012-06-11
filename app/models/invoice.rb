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
  attr_accessible :price, :updated_at
  attr_accessible :state # 0: waiting, 1: valid, 2: ready

  # Relations
  belongs_to :table
  belongs_to :restaurant
  has_many :invoices_products, dependent: :delete_all
  has_many :products, :through => :invoices_products

end
