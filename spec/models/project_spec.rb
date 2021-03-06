require 'rails_helper'

RSpec.describe Project, type: :model do

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
      should validate_length_of(:title).is_at_most(30)
    end
  end

  describe 'its points' do
    it do
      should validate_presence_of(:points)
    end
  end

  describe 'its description' do
    it do
      should validate_presence_of(:description)
      should validate_uniqueness_of(:description)
      should validate_length_of(:description).is_at_least(5)
      should validate_length_of(:description).is_at_most(500)
    end
  end

  describe 'its github' do
    it do
      should validate_presence_of(:github)
      should validate_length_of(:github).is_at_least(10)
      should validate_length_of(:github).is_at_most(200)
      should validate_uniqueness_of(:github)
    end
  end

  describe 'its category' do
    it do
      should validate_presence_of(:project_type)
      should validate_length_of(:project_type).is_at_most(20)
    end
  end

end