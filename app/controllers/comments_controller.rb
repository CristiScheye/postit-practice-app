class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit!)
		@comment.user_id = 1 #Change later, after authentication!

		if @comment.save
			flash[:notice] = "Your comment was successfully saved"
			redirect_to post_path(@post.id)
		else
			render 'posts/show'
		end
	end
end