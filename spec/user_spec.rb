require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it "a valid password" do
      @user = User.create(name: "Billy" ,email: "test@test.com", password: "passw0rd", password_confirmation: "passw0rd")
      @user.save!
      expect(@user.password).to eq("passw0rd")
    end
    it "password matches confirmation password" do
      @user = User.create(name: "Billy" ,email: "test@test.com", password: "passw0rd", password_confirmation: "passw0rd")
      @user.save!
      expect(@user.password).to eq(@user.password_confirmation)
    end
    it "password does not match confirmation password" do
      @user = User.create(name: "Billy" ,email: "test@test.com", password: "passw0rd", password_confirmation: "password")
      expect(@user.password).not_to eq(@user.password_confirmation)
    end
    it "email, first and last name is required" do
      @user = User.create(name: nil ,email: nil, password: nil, password_confirmation: nil)
      expect(@user.errors.full_messages).to eq(["Name can't be blank", "Password can't be blank", "Password is too short (minimum is 3 characters)", "Password can't be blank"])
    end
    it "password must be minimum 3 characters" do
      User.create(name: "Billy", email: "test@test.com", password: "12", password_confirmation: "12").should_not be_valid
      User.create(name: "Billy", email: "test@test.com", password: "123", password_confirmation: "123").should be_valid
    end
  end
end