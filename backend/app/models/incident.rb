# == Schema Information
#
# Table name: incidents
#
#  id          :bigint           not null, primary key
#  address     :string
#  description :text
#  age         :integer          not null
#  gender      :integer          not null
#  status      :integer          not null
#  latitude    :float            not null
#  longitude   :float            not null
#  confirmed   :boolean          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  archived    :boolean          default(FALSE)
#

class Incident < ApplicationRecord
  enum gender: %i(male female unknown other)
  enum status: %i(suspicious awaiting_result positive recovered dead)

  validates :latitude, :longitude, :status, :gender, :age, :user, presence: true

  belongs_to :user
end
