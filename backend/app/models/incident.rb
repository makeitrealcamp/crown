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
#

class Incident < ApplicationRecord
  enum gender: %i(male female)
  enum status: %i(suspicious awaiting_result positive recoveried dead)

  validates :latitude, :longitude, :status, :gender, :age, presence: true
end
