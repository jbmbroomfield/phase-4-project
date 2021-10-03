class ForumThread < ApplicationRecord

    belongs_to :section
    has_many :posts
    has_many :users, through: :posts

    validates :section, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 32 }

    def to_s
        self.title
    end

    def user=(user)
        post = first_post
        post.user = user
        post.save
    end

    def user_id=(user_id)
        self.user = User.find(user_id)
    end

    def text=(text)
        post = first_post
        post.text = text
        post.save
    end

    private

    def first_post
        self.posts.first || Post.new(thread: self, user_id: 1, text: 'placeholder')
    end

end
