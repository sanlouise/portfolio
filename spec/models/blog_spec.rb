require 'rails_helper'

RSpec.describe Blog, type: :model do

  describe 'its association' do
    it 'with user' do
      should belong_to(:user)
    end
  end

  describe 'its title' do
    it do
      should validate_presence_of(:title)
      should validate_uniqueness_of(:title)
      should validate_length_of(:title).is_at_least(2)
    end
  end


  describe 'its body' do
    it do
      should validate_presence_of(:body)
      should validate_uniqueness_of(:body)
      should validate_length_of(:body).is_at_least(2)
    end
  end

  describe 'its topic' do
    it do
      should validate_presence_of(:topic)
    end
  end

end