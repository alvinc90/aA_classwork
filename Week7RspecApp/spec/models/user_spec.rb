require 'rails_helper'

RSpec.describe User, type: :model do

    subject(:alvin) {User.create(username: "alvin123", password: "password123")}

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }

    describe "session_token" do
        it "assigns a session_token if none given" do
        expect(FactoryBot.build(:user).session_token).not_to be_nil
        end
    end

    describe "password encryption"  do
        it "does not save passwords to the database" do
            FactoryBot.create(:user, username: "Summer Solstice")
            user = User.find_by(username: "Summer Solstice")
            expect(user.password).not_to eq("password")
        end
        it "encrypts password using BCrypt" do
            expect(BCrypt::Password).to receive(:create).with("abcdef")
            FactoryBot.build(:user, password: "abcdef")
        end
    end

end