class Post < ApplicationRecord

    belongs_to :user
    belongs_to :thread, class_name: 'ForumThread'

    validates :text, presence: true

end
