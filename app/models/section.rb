class Section < ApplicationRecord

    has_many :threads, class_name: 'ForumThread'
    has_many :posts, through: :threads
    has_many :users, through: :posts

    validates :title, presence: true

end
