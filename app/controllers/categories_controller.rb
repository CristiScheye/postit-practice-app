class CategoriesController < ApplicationController
	before_action :validate_admin, except: [:show]

	def show
		@category = Category.find_by(slug: params[:id])
	end

	def new
		@category = Category.new
	end

	def create

		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Category successfully saved"
			redirect_to posts_path
		else
			render :new
		end

	end
	private

	def category_params
		params.require(:category).permit(:name)
	end

	def validate_admin
		if !admin?
			redirect_to :back, alert: "Access Denied"
		end
		rescue ActionController::RedirectBackError
			redirect_to root_path
	end

end