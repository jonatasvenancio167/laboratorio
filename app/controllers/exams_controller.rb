class ExamsController < ApplicationController
  
  before_action :set_exam, only: :show
  skip_before_action :verify_authenticity_token  

  def index
    @exam = Exam.where(status: true)

    @exam = @exam.where(nome: params[:nome]) if params[:nome]

    render json: @exam
  end

  def show
  end

  # <Sumary>
  # inserting data into the table and after inserting, checking the data to see if everything is ok

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
       @exam
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

  def set_exam
    @exams = Exam.find(params[:id])
  end

  # <Sumary>
  # Only allow a trusted parameter "white list" through.
  def exam_params
      params.permit(:nome, :tipo, :status, :laboratory_id)
    end
end
