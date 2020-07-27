class Article < ApplicationRecord
    validates :title, :extract, presence: true
    belongs_to :user
end

#TODO confirm article datamodel