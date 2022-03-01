class User < ApplicationRecord
    has_secure_password
    has_many :blogs, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, uniqueness:{case_sensitive:true}, format: { with: VALID_EMAIL_REGEX }
    # validates :password, presence:true

#     validate :password_confirmation_matches_password

#   def password_confirmation_matches_password
#     if password != password_confirmation
#       errors.add(:password_confirmation, "isn't the same")
#     end
#   end
end
