# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  username        :string           not null
#  password_digest :string           not null
#  admin           :boolean          default(FALSE)
#  status          :integer          default("active")
#  validator       :boolean          default(FALSE)
#  organization    :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Johnny",
      last_name: "Depp",
      email: "pirate@email.com",
      username: "iamthepirate",
      password: "living-at-the-ocean",
    )
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid user when name is not present' do
    @user.name = nil

    refute @user.valid?
    assert_not_nil @user.errors[:name]
  end

  test 'invalid user when last_name is not present' do
    @user.last_name = nil

    refute @user.valid?
    assert_not_nil @user.errors[:last_name]
  end

  test 'invalid user when email is not present' do
    @user.email = nil

    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid user when username is not present' do
    @user.username = nil

    refute @user.valid?
    assert_not_nil @user.errors[:username]
  end

  test 'invalid user when password is not present' do
    @user.password = nil

    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end
end
