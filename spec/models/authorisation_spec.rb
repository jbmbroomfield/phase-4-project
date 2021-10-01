require 'rails_helper'

user = User.create(username: 'Alice', email: 'alice@mail.com')
password = '123'
password_confirmation = '123'
incorrect_password = '1234'

RSpec.describe Authorisation, type: :model do

  context 'validation tests' do
    it 'should require user' do
      authorisation = Authorisation.new(password: password, password_confirmation: password_confirmation).save
      expect(authorisation).to eq(false)
    end
    it 'should require password' do
      authorisation = Authorisation.new(user: User.new, password_confirmation: password_confirmation).save
      expect(authorisation).to eq(false)
    end
    it 'should save successfully' do
      authorisation = Authorisation.new(user: User.new, password: password, password_confirmation: password_confirmation).save
      expect(authorisation).to eq(true)
    end
    it 'should create a password digest' do
      authorisation = Authorisation.create(user: User.new, password: password, password_confirmation: password_confirmation)
      expect(authorisation.password_digest).to be_truthy
    end
    it 'should be invalid with incorrect password confirmation' do
      authorisation = Authorisation.new(user: User.new, password: password, password_confirmation: incorrect_password).save
      expect(authorisation).to eq(false)
    end
  end

  context 'authenticate' do
    it 'returns the authorisation if credentials match' do
      authorisation = Authorisation.new
      authorisation.password = password
      expect(authorisation.authenticate(password)).to eq(authorisation)
    end
    it "returns falsey if credentials don't match" do
      authorisation = Authorisation.new
      authorisation.password = password
      expect(authorisation.authenticate(incorrect_password)).to be_falsey
    end
  end

end
