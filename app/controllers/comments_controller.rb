class CommentsController < ApplicationController
	before_action :check_login

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit!)
		@comment.user = @current_user

		if @comment.save
			flash[:notice] = "Your comment was successfully saved"
			redirect_to post_path(@post.id)
		else
			render 'posts/show'
		end
	end
end