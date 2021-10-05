class Section < ApplicationRecord

    has_many :threads, class_name: 'ForumThread'
    has_many :posts, through: :threads
    has_many :users, -> { distinct }, through: :posts

    validates :title, presence: true

    def to_s
        self.title
    end

    def threads_count
        threads.count
    end

    def posts_count
        posts.count
    end

    def users_count
        users.count
    end

end
