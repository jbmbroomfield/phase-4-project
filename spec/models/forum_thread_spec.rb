require 'rails_helper'

section = Section.create(title: 'New Section')
title = 'New Thread'
too_long = 'New Threadddddddddddddddddddddddddd'

RSpec.describe ForumThread, type: :model do
  
  context 'validation tests' do
    it 'should require section' do
      thread = ForumThread.new(title: title).save
      expect(thread).to eq(false)
    end
    it 'should require title' do
      thread = ForumThread.new(section: section).save
      expect(thread).to eq(false)
    end
    it 'should require title to be no more than 32 characters' do
      thread = ForumThread.new(section: section, title: too_long)
    end
    it 'should save successfully' do
      thread = ForumThread.new(section: section, title: title).save
    end
  end

end
