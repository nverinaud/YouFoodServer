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
    @user = User.new(name: "John", email: "john@doe.com", password: "password")
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

  it { should be_valid }

  describe "empty email" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "invalid email" do
    invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "valid email" do
    valid_addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end
end
