class Article < ApplicationRecord
    validates :title, :user_id, :text, presence: true
    belongs_to :user
end
