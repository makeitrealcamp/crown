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

class User < ApplicationRecord
  enum status: %i(active pending blocked)
end
