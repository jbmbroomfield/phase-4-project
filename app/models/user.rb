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
    
    def self.create(params)
        if User.count == 0
            params[:admin] = true
        end
        super(params)
    end

end
