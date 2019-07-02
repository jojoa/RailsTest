class TagsToPost < ApplicationRecord
    belongs_to :post, class_name: "Post"
    belongs_to :tag, class_name: "Tag"
end
