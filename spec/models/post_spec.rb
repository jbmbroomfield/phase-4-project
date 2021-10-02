require 'rails_helper'

user = User.create(username: 'Alice', email: 'alice@mail.com')
section = Section.create(title: 'Section')
thread = ForumThread.create(section: section, title: 'Thread')

RSpec.describe Post, type: :model do
  
  context 'validation tests' do
    it 'should require user' do
      post = Post.new(thread: thread, text: text).save
      expect(post).to eq(false)
    end
    it 'should require thread' do
      post = Post.new(user: user, text: text).save
      expect(post).to eq(false)
    end
    it 'should require text' do
      post = Post.new(user: user, thread: thread).save
      expect(post).to eq(false)
    end
    it 'should save successfully' do
      post = Post.new(user: user, thread: thread, text: text).save
      expect(post).to eq(true)
    end
  end

end
