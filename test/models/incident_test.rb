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

require 'test_helper'

class IncidentTest < ActiveSupport::TestCase

  def setup
    @incident = Incident.new(
      age: 30,
      gender: Incident.genders[:male],
      status: Incident.statuses[:positive],
      latitude: 6.256865,
      longitude: -75.592775,
      confirmed: true
    )
  end

  test 'valid incident' do
    assert @incident.valid?
  end

  test 'invalid incident when age is not present' do
    @incident.age = nil

    refute @incident.valid?
    assert_not_nil @incident.errors[:age]
  end

  test 'invalid incident when gender is not present' do
    @incident.gender = nil

    refute @incident.valid?
    assert_not_nil @incident.errors[:gender]
  end

  test 'invalid incident when status is not present' do
    @incident.status = nil

    refute @incident.valid?
    assert_not_nil @incident.errors[:status]
  end

  test 'invalid incident when latitude is not present' do
    @incident.latitude = nil

    refute @incident.valid?
    assert_not_nil @incident.errors[:latitude]
  end

  test 'invalid incident when longitude is not present' do
    @incident.longitude = nil

    refute @incident.valid?
    assert_not_nil @incident.errors[:longitude]
  end
end
