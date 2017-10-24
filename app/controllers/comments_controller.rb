class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_name = current_user.name
		if @comment.save
			redirect_to post_path(params[:post_id])
		else
			redirect_to post_path(params[:post_id])
		end
	end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(params[:post_id])
	end
	private
	def comment_params
		params.require(:comment).permit(:user_name,:post_id,:body)
	end
end
