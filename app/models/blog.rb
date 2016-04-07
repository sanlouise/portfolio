class Blog < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :body, presence: true, length: { minimum: 2 }
  
end