class Post < ApplicationRecord

    belongs_to :user
    belongs_to :thread, class_name: 'ForumThread', foreign_key: 'thread_id'

    validates :text, presence: true

    def forum_thread_id
        self.thread_id
    end

    def forum_thread_id=(thread_id)
        self.thread_id = thread_id
    end

end
