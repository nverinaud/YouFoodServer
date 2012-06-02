class InvoicesProduct < ActiveRecord::Base
  attr_accessible :comment

  #Relations
  belongs_to :product
  belongs_to :invoice
end
