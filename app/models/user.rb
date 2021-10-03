class User < ApplicationRecord

    has_one :password_authentication
    has_one :facebook_authentication
    has_many :posts
    has_many :threads, -> { distinct }, through: :posts
    has_many :sections, -> { distinct }, through: :threads

    validates :username, presence: true
    validates :email, presence: true

    def to_s
        self.username
    end
    
    def authenticate(password)
        return password_authentication && password_authentication.authenticate(password_authentication)
    end

    def password=(password)
        get_password_authentication.password = password
    end

    def password_confirmation=(password_confirmation)
        get_password_authentication.password_confirmation = password_confirmation
    end

    def get_password_authentication
        PasswordAuthentication.find_or_create_by(user: self)
    end
        

end
