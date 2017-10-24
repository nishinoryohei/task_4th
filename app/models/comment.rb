class Comment < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :post
	validates :body, presence: true
end
