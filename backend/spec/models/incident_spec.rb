require 'rails_helper'

RSpec.describe Incident, type: :model do
  before { create(:user, name: "Bruce") }

  describe "Validations" do
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:user) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "The incident values are valid" do
    it "should create the incident" do
      subject.latitude = 1.2
      subject.longitude = 1.2
      subject.status = 1
      subject.gender = 1
      subject.age = 19
      subject.user = User.last

      expect(subject).to be_valid
    end
  end

  describe "The incident values are invalid" do
    it "should return a error without user" do
      subject.latitude = 1.2
      subject.longitude = 1.2
      subject.status = 1
      subject.gender = 1
      subject.age = 19

      expect(subject).to_not be_valid
      expect(subject.errors.messages).to eq({:user=>["can't be blank", "must exist"]})
    end

    it "should return a errors of presence" do
      expected_errors = {
        :age => ["can't be blank"],
        :gender => ["can't be blank"],
        :latitude => ["can't be blank"],
        :longitude => ["can't be blank"],
        :status => ["can't be blank"],
        :user => ["can't be blank", "must exist"]
      }

      expect(subject).to_not be_valid
      expect(subject.errors.messages).to eq(expected_errors)
    end
  end
end

