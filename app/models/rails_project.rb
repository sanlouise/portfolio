class RailsProject < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :description, presence: true, uniqueness: true, length: {minimum: 5, maximum: 50 }
  validates :points, presence: true, uniqueness: true
  validates :github, presence: true, uniqueness: true, length: { minimum: 10, maximum: 100 }
  validates :live_link, presence: true, uniqueness: true, length: { minimum: 10, maximum: 100 }
  validates :image, presence: true, uniqueness: true, length: { minimum: 10, maximum: 100 }
  
end
