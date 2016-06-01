class Blog < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 2}
  validates :body, presence: true, length: { minimum: 2 }
  
  scope :javascript, -> { where(topic: 'Javascript') }
  scope :ruby_on_rails, -> { where(topic: 'Ruby on Rails') }
  scope :personal_development, -> { where(topic: 'Personal Development') }
  scope :other, -> { where(topic: 'Other') }
  
end