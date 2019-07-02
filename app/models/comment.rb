class Comment < ApplicationRecord
    validates :text, presence:true, length: { maximum: 140}
    belongs_to :post
end
