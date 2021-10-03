class Post < ApplicationRecord

    belongs_to :user
    belongs_to :thread, class_name: 'ForumThread'

    validates :text, presence: true

    def forum_thread_id=(thread_id)
        self.thread_id = thread_id
    end

end
