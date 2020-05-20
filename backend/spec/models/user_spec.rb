require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe "Associations" do
    it { should have_many(:incidents) }
  end

  describe "the user values are valid" do
    it "should create the user" do
      subject.name = "bat"
      subject.last_name = "man"
      subject.email = "batman@mail.com"
      subject.password = "baticave123"
      subject.username = "batman"

      expect(subject).to be_valid
      expect(subject.admin).to be_falsey
    end
  end

  describe "the user values are invalid" do
    it "should return a error email format" do
      subject.name = "bat"
      subject.last_name = "man"
      subject.email = "batmanmailcom"
      subject.password = "baticave123"
      subject.username = "batman"

      expect(subject).to_not be_valid
      expect(subject.errors.messages).to eq(:email=>["is invalid"])
    end

    it "should return a error pasword format" do
      subject.name = "bat"
      subject.last_name = "man"
      subject.email = "batman@mail.com"
      subject.password = "bati"
      subject.username = "batman"

      expect(subject).to_not be_valid
      expect(subject.errors.messages).to eq(:password=>["is too short (minimum is 6 characters)"])
    end

    it "should return a errors of presence" do
      expected_errors = {
        :email=>["can't be blank", "is invalid"],
        :last_name=>["can't be blank"],
        :name=>["can't be blank"],
        :password=>["can't be blank", "is too short (minimum is 6 characters)"],
        :username=>["can't be blank"]
      }

      expect(subject).to_not be_valid
      expect(subject.errors.messages).to eq(expected_errors)
    end
  end

  describe "Methods" do
    it "#admin?" do
      subject.name = "bat"
      subject.last_name = "man"
      subject.email = "batman@mail.com"
      subject.password = "baticave123"
      subject.username = "batman"
      subject.admin = true

      expect(subject).to be_valid
      expect(subject.admin?).to be_truthy
    end

    it "#set_status_to_pending" do
      subject.name = "bat"
      subject.last_name = "man"
      subject.email = "batman@mail.com"
      subject.password = "baticave123"
      subject.username = "batman"
      subject.set_status_to_pending

      expect(subject).to be_valid
      expect(subject.status).to eq("pending")
    end

    it "#validator?, organization?, regular?" do
      subject.name = "bat"
      subject.last_name = "man"
      subject.email = "batman@mail.com"
      subject.password = "baticave123"
      subject.username = "batman"

      expect(subject).to be_valid
      expect(subject.validator?).to be_falsey
      expect(subject.organization?).to be_falsey
      expect(subject.regular?).to be_truthy
    end
  end
end

