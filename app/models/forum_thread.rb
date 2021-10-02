class ForumThread < ApplicationRecord

    belongs_to :section

    validates :section, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 32 }

end
