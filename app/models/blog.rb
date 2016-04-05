class Blog < ActiveRecord::Base
  
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :body, presence: true
  
end