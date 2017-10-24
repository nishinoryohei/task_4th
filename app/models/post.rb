class Post < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	mount_uploader :image, ImageUploader
	validates :title, presence: true
	validates :body, presence: true
	belongs_to :user
	has_many :favorites,dependent: :destroy
	has_many :comments, dependent: :destroy
	def favorited_by? user
		favorites.where(user_id: user.id).exists?
	end
end
