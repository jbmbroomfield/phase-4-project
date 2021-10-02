class ForumThread < ApplicationRecord

    belongs_to :section
    has_many :posts
    has_many :users, through: :posts

    validates :section, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 32 }

end
