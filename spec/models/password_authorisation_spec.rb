require 'rails_helper'

user = User.create(username: 'Alice', email: 'alice@mail.com')
password = '123'
password_confirmation = '123'
incorrect_password = '1234'

RSpec.describe PasswordAuthorisation, type: :model do

  context 'validation tests' do
    it 'should require user' do
      password_authorisation = PasswordAuthorisation.new(password: password, password_confirmation: password_confirmation).save
      expect(password_authorisation).to eq(false)
    end
    it 'should require password' do
      password_authorisation = PasswordAuthorisation.new(user: User.new, password_confirmation: password_confirmation).save
      expect(password_authorisation).to eq(false)
    end
    it 'should save successfully' do
      password_authorisation = PasswordAuthorisation.new(user: User.new, password: password, password_confirmation: password_confirmation).save
      expect(password_authorisation).to eq(true)
    end
    it 'should create a password digest' do
      password_authorisation = PasswordAuthorisation.create(user: User.new, password: password, password_confirmation: password_confirmation)
      expect(password_authorisation.password_digest).to be_truthy
    end
    it 'should be invalid with incorrect password confirmation' do
      password_authorisation = PasswordAuthorisation.new(user: User.new, password: password, password_confirmation: incorrect_password).save
      expect(password_authorisation).to eq(false)
    end
  end

  context 'authenticate' do
    it 'returns the password_authorisation if credentials match' do
      password_authorisation = PasswordAuthorisation.new
      password_authorisation.password = password
      expect(password_authorisation.authenticate(password)).to eq(password_authorisation)
    end
    it "returns falsey if credentials don't match" do
      password_authorisation = PasswordAuthorisation.new
      password_authorisation.password = password
      expect(password_authorisation.authenticate(incorrect_password)).to be_falsey
    end
  end

end
