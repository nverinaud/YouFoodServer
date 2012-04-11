# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  number     :integer
#  email      :string(255)
#  type       :string(255)
#  name       :string(255)
#  phone      :string(255)
#  address    :string(255)
#  zipCode    :integer
#  city       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require "rspec"

describe User do
  before do
    @user = User.new
  end
  subject { @user }

  it { should respond_to :id }
  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :password_digest }
  it { should respond_to :type }
  it { should respond_to :name }
  it { should respond_to :phone }
  it { should respond_to :address }
  it { should respond_to :zipCode }
  it { should respond_to :city }
end
