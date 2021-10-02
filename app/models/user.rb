class User < ApplicationRecord

    has_one :password_authentication
    has_one :facebook_authentication

    validates :username, presence: true
    validates :email, presence: true
    
    def authenticate(password)
        return password_authentication && password_authentication.authenticate(password_authentication)
    end

end
