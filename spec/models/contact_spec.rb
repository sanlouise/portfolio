require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'name' do
    it do
      should validate_presence_of(:name)
      should validate_length_of(:name).is_at_most(150)
    end
  end

  describe 'comments' do
    it do
      should validate_presence_of(:comments)
      should validate_length_of(:comments).is_at_most(1000)
    end
  end

  describe 'its email' do
    it do
      should validate_presence_of(:topic)
      should validate_length_of(:comments).is_at_most(150)
    end
  end

end