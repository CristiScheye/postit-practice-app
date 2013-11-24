class CommentsController < ApplicationController
	before_action :check_login

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit!)
		@comment.user = @current_user

		if @comment.save
			flash[:notice] = "Your comment was successfully saved"
			redirect_to post_path(@comment.post)
		else
			render 'posts/show'
		end
	end

	def vote
		comment = Comment.find(params[:id])
		post = Post.find(params[:post_id])
		Vote.create(vote: params[:vote], user: @current_user, voteable: comment)

		redirect_to post_path(post)

	end
end