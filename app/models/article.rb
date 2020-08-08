class Article < ApplicationRecord
    validates :title, :user_id, :extract, :pageid, presence: true
    belongs_to :user
end

#TODO confirm article datamodel