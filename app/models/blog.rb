class Blog < ActiveRecord::Base
  
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 2}
  validates :body, presence: true, length: { minimum: 2 }
  
  scope :javascript, -> { where(topic: 'Javascript') }
  scope :ruby_on_rails, -> { where(topic: 'Ruby on Rails') }
  scope :personal_development, -> { where(topic: 'Personal Development') }
  scope :cs_fundamentals, -> { where(topic: 'CS Fundamentals') }
  scope :other, -> { where(topic: 'Other') }
  
  default_scope { order(created_at: :desc) }
  
  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
  end
  
  
end