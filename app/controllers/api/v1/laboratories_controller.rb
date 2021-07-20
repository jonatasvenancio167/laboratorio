class Api::V1::LaboratoriesController < ApplicationController


	# <Sumary>
	# returns a list of active labs

	def index
		@laboratories = Laboratory.where(status: true)

		render json: @laboratories
	end


	def show
	end

	# <Sumary>
	# Performs the data insertions and after that, checks if the data can be saved

	def create
		@laboratory = Laboratory.new(name: params[:name], address: params[:address], status: params[:status])

		if @laboratory.save
			render json: @laboratory, status: created
		else
			render json: @laboratory.errors, status: :unprocessable_entity
		end
	end


	def update
		if @laboratory = Laboratory.update(laboratory_params)
			render json: @laboratory
		else 
			render json: @laboratory.errors, status: :unprocessable_entity
		end
	end


	def destory
		@laboratory = Laboratory.find(params[:id])

		@laboratory.destroy if @laboratory.status == true
	end


	private

	def set_laboratories
		@laboratory = Laboratory.find(pararms[:id])
	end

	def laboratory_params
		params.require(:laboratory).permit(:name, :address, :status)
	end
end
