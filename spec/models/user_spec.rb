require 'rails_helper'

sample_username = 'Alice'
sample_email = 'alice@mail.com'

RSpec.describe User, type: :model do

  context 'validation tests' do
      it 'should require username' do
      user = User.new(email: sample_email).save
      expect(user).to eq(false)
    end
    it 'should require email' do
      user = User.new(username: sample_username).save
      expect(user).to eq(false)
    end
    it 'should save successfully' do
      user = User.new(username: sample_username, email: sample_email).save
      expect(user).to eq(true)
    end
    it 'should default admin to false' do
      user = User.create(username: sample_username, email: sample_email)
      expect(user.admin).to eq(false)
    end
  end

end
