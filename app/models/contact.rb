class Contact < ActiveRecord::Base
  
  validates :name, presence: true, length: {maximum: 150}
  validates :comments, presence: true, length: {maximum: 5000}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }

end

