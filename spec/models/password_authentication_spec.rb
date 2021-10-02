require 'rails_helper'

user = User.create(username: 'Alice', email: 'alice@mail.com')
password = '123'
password_confirmation = '123'
incorrect_password = '1234'

RSpec.describe PasswordAuthentication, type: :model do

  context 'validation tests' do
    it 'should require user' do
      password_authentication = PasswordAuthentication.new(password: password, password_confirmation: password_confirmation).save
      expect(password_authentication).to eq(false)
    end
    it 'should require password' do
      password_authentication = PasswordAuthentication.new(user: User.new, password_confirmation: password_confirmation).save
      expect(password_authentication).to eq(false)
    end
    it 'should save successfully' do
      password_authentication = PasswordAuthentication.new(user: User.new, password: password, password_confirmation: password_confirmation).save
      expect(password_authentication).to eq(true)
    end
    it 'should create a password digest' do
      password_authentication = PasswordAuthentication.create(user: User.new, password: password, password_confirmation: password_confirmation)
      expect(password_authentication.password_digest).to be_truthy
    end
    it 'should be invalid with incorrect password confirmation' do
      password_authentication = PasswordAuthentication.new(user: User.new, password: password, password_confirmation: incorrect_password).save
      expect(password_authentication).to eq(false)
    end
  end

  context 'authenticate' do
    it 'returns the password_authentication if credentials match' do
      password_authentication = PasswordAuthentication.new
      password_authentication.password = password
      expect(password_authentication.authenticate(password)).to eq(password_authentication)
    end
    it "returns falsey if credentials don't match" do
      password_authentication = PasswordAuthentication.new
      password_authentication.password = password
      expect(password_authentication.authenticate(incorrect_password)).to be_falsey
    end
  end

end
