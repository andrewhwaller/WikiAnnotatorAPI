class Article < ApplicationRecord
    validates :title, :user_id, :text, presence: true
    belongs_to :user
end

#TODO confirm article datamodel