class ForumThread < ApplicationRecord

    belongs_to :section
    has_many :posts
    has_many :users, through: :posts

    validates :section, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 32 }

    def user=(user)
        post = first_post
        post.user = user
        post.save
    end

    def text=(text)
        post = first_post
        post.text = text
        post.save
    end

    private

    def first_post
        self.posts.first || self.posts.new
    end

end
