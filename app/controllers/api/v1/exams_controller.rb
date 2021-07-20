class Api::V1::ExamsController < ApplicationController

	def index
		@exam = Exam.where(status: true)

		render json: @exam
	end

	def show
	end

	# <Sumary>
	# inserting data into the table and after inserting, checking the data to see if everything is ok

	def create
		@exam = Exam.new(name: params[:name], address: params[:address], status: params[:status])
		if @exam.save
			render json: @exam, status: created
		else
			render json: @exam.errors, status: :unprocessable_entity
		end
	end

	# <Sumary>
	# updated the of dates

	def update
		if @exam = Exam.update(exam_params)
			render json: @exam
		else
			render json: @exam.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@exam = Exam.find(params[:id])

		@exam.destroy if @exam.status == true
	end

	private

	# <Sumary>
	# Use callbacks to share common setup or constraints between actions.

	def set_exams
		@exams = Exam.find(params[:id])
	end

	# <Sumary>
	# Only allow a trusted parameter "white list" through.

	def exams_params
		params.require(:exam).permit(:name, :address, :status)
	end

end
