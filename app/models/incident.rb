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
end
