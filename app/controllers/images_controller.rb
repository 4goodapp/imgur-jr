class ImagesController < ApplicationController

	def new
		@image = Image.new()
	end

	def create
		@image = Image.create(image_params)
		redirect_to image_path(@image)
	end

	def show
		@image = Image.find(params[:id])
	end

	def image_params
		params.require(:image).permit(:image)
	end
end
