class ForumThread < ApplicationRecord

    belongs_to :section
    has_many :posts, inverse_of: :thread, foreign_key: 'thread_id'
    has_many :users, through: :posts

    validates :section, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 32 }

    def to_s
        self.title
    end

    def post=(params)
        first_post = Post.new(params)
        first_post.thread = self
        first_post.save
    end

end
