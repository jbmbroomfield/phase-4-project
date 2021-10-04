class User < ApplicationRecord

    has_secure_password

    has_one :password_authentication
    has_one :facebook_authentication
    has_many :posts
    has_many :threads, -> { distinct }, through: :posts
    has_many :sections, -> { distinct }, through: :threads

    validates :username, presence: true
    validates :email, presence: true

    scope :admins, -> { where(admin: true) }

    def to_s
        self.username
    end
    
    # def authenticate(password)
    #     return password_authentication && password_authentication.authenticate(password_authentication)
    # end

    # def password=(password)
    #     password_authentication = get_password_authentication
    #     password_authentication.password = password
    #     password_authentication.save
    # end

    # def password_confirmation=(password_confirmation)
    #     password_authentication = get_password_authentication
    #     password_authentication.password_confirmation = password_confirmation
    #     password_authentication.save
    # end

    # def get_password_authentication
    #     PasswordAuthentication.find_or_create_by(user: self)
    # end
        

end
