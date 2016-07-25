require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(username: "vanwykjd", email: "joshvanwyk@ymail.com", password: "password") }
   # Shoulda tests for username
   it { is_expected.to validate_presence_of(:username) }
   it { is_expected.to validate_length_of(:username).is_at_least(1) }
 
   # Shoulda tests for email
   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("joshvanwyk@ymail.com").for(:email) }
 
   # Shoulda tests for password
   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }
 
   describe "attributes" do
     it "should have username and email attributes" do
       expect(user).to have_attributes(username: "vanwykjd", email: "joshvanwyk@ymail.com")
     end
   end
   
   ##Invalid User
   describe "invalid user" do
     let(:user_with_invalid_username) { User.new(username: "", email: "joshvanwyk@ymail.com") }
     let(:user_with_invalid_email) { User.new(username: "vanwykjd", email: "") }
 
     it "should be an invalid user due to blank username" do
       expect(user_with_invalid_username).to_not be_valid
     end
 
     it "should be an invalid user due to blank email" do
       expect(user_with_invalid_email).to_not be_valid
     end
 
   end
end
