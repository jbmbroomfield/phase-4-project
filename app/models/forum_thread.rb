class ForumThread < ApplicationRecord

    belongs_to :section
    has_many :posts, inverse_of: :thread, foreign_key: 'thread_id'
    has_many :users, -> { distinct }, through: :posts

    validates :section, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 32 }

    accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes['text'].blank? }
    validates_associated :posts

    def to_s
        self.title
    end

    def post=(params)
        new_post = Post.new(params)
        new_post.thread = self
        new_post.save
    end

    def started_by
        posts.first.user
    end

    def posts_count
        posts.count
    end

    def users_count
        users.count
    end

end
