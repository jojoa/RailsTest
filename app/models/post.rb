class Post < ApplicationRecord
    validates :title, presence:true, length: {maximum: 80}
    validates :text, presence:true, length: {minimum: 50}
    
    has_many :comments
    has_and_belongs_to_many :tags
end
