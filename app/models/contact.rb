class Contact < ApplicationRecord
  belongs_to :user
  
  attr_accessor :name, :message
   
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :message, presence: true, length: { maximum: 500 }
end
