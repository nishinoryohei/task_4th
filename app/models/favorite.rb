class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates :post, presence: true
	validates :user_id, uniqueness: {scope: :post_id}
	validates :post, presence: true
end
