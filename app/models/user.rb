class User < ApplicationRecord

    has_one :authorisation

    validates :username, presence: true
    validates :email, presence: true

end
