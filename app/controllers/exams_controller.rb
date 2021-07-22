class ExamsController < ApplicationController
  
  before_action :set_exam, only: :show
  skip_before_action :verify_authenticity_token  

  def index
    @exams = Exam.where(status: true)

    @exams = @exams.where(nome: params[:nome]) if params[:nome].present?
    @laboratory_exams = LaboratoryExam.where(exam_id: @exams)
  end

  def show
  end

  # <Sumary>
  # inserting data into the table and after inserting, checking the data to see if everything is ok

  def create
    @exams = Exam.new(exam_params)
    laboratorys = params[:laboratory_id]

    if @exams.save

        laboratorys.each do |laboratory|
          LaboratoryExam.create(laboratory_id: laboratory, exam_id: @exams.id)
        end

      @exam

    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # <Sumary>
  # updated the of dates

  def update
    @exam = Exam.find(params[:id])

    if @exam.update!(exam_params)
      render json: @exam, status: :ok
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  def destroy

    exam_id = params[:id]

    begin
      @exam = Exam.find(exam_id)
      @exam.delete if @exam.status == true
      render json: "#{@exam.nome} deletado com sucesso!"
    rescue ActiveRecord::RecordNotFound
      render json: 'esse dado já foi deletado!'
    end

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
      params.require(:exam).permit(:nome, :tipo, :status, :laboratory_id => [])
    end
end
