require 'rails_helper'

RSpec.describe Section, type: :model do

  context 'validation tests' do
    it 'should require title' do
      section = Section.new.save
      expect(section).to eq(false)
    end
    it 'should save successfully' do
      section = Section.new(title: 'New Section').save
      expect(section).to eq(true)
    end
  end

end
