class LaboratoriesController < ApplicationController

  before_action :set_laboratories, only: :show
  skip_before_action :verify_authenticity_token  

  # <Sumary>
  # returns a list of active labs

  def index
    @laboratories = Laboratory.where(status: true)

    render json: @laboratories
  end


  def show
    render json: @laboratory
  end

  # <Sumary>
  # Performs the data insertions and after that, checks if the data can be saved

  def create
    @laboratory = Laboratory.new(laboratory_params)
    if @laboratory.save
      render json: @laboratory, status: :created
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
    @laboratory = Laboratory.find(params[:id])
  end

  def laboratory_params
    params.permit(:nome, :endereco, :status)
  end
end
