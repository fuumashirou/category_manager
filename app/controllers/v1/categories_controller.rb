module V1
	class CategoriesController < ApplicationController

		def index
			@category = Category.all
			render json: @categories
		end

		def create
		  @category = Category.new(category_params)

		  if @category.save
		    render json: @category
		  else
		    render json: @category.errors, status: :unprocessable_entity
		  end
		end

		def show
			@category = Category.find(params[:id])

			@result = Category.get_data(@category.id)
			@output = @result.to_json

			respond_to do |format|
				format.html
				format.json {render json:@output}
			end
  	end

		private

		def category_params
			params.require(:category).permit(:name, :parent_id)
		end
	end
end