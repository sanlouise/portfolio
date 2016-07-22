class Blog < ActiveRecord::Base
  
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 2}
  validates :body, presence: true, length: { minimum: 2 }
  validates :topic, presence: true
  
end