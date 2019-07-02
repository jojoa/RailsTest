class Tag < ApplicationRecord
    has_many :tags_to_post, class_name: "Tags_to_post",
        foreign_key: "follower_id",
        dependent:  :destroy
end
