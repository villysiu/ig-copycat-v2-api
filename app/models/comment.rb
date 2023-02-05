class Comment < ApplicationRecord
    belongs_to :photo
    belogns_to :user
end
