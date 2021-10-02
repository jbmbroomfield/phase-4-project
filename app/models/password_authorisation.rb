class PasswordAuthorisation < ApplicationRecord

    belongs_to :user

    validates :password_digest, presence: true

    has_secure_password

end
