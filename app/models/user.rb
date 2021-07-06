class User < ApplicationRecord
    validates :firstname, :lastname,presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :email, uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates :birthday, :gender, presence: true
end
