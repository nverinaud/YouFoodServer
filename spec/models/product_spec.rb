# == Schema Information
#
# Table name: products
#
#  id           :integer         not null, primary key
#  price        :decimal(, )
#  name         :string(255)
#  abbreviation :string(255)
#  description  :text
#  photoURL     :string(255)
#  permanent    :boolean
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
end
