class PostsController < ApplicationController
	before_action :set_post, only:[:show,:edit,:update,:destroy]
	before_action :correct_user, only:[:edit,:update]
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end
	def index
		@posts = Post.page(params[:page]).per(10)
	end
	def show
		@comment = Comment.new
	end
	def edit
	end
	def update
		if @post.update
			redirect_to post_path(@post.id)
		else
			render :edit
		end
	end
	def destroy
		@post.destroy
		redirect_to posts_path
	end
	private
	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title,:body,:user_id,:image)
	end
	def correct_user
		post = Post.find(params[:id])
		if current_user.id != post.user.id
			redirect_to root_path
		end
	end
end
