class LaboratoriesController < ApplicationController

  before_action :set_laboratories, only: :show
  skip_before_action :verify_authenticity_token  

  # <Sumary>
  # returns a list of active labs

   # GET /laboratories
  # GET /laboratories.json

  def index
    @laboratories = Laboratory.where(status: true)
  end

  # GET /laboratories/1
  # GET /laboratories/1.json

  def show
    render json: @laboratory
  end

  # <Sumary>
  # Performs the data insertions and after that, checks if the data can be saved

  # POST /laboratories
  # POST /laboratories.json

  def create
    @laboratory = Laboratory.new(laboratory_params)
    if @laboratory.save
      render json: @laboratory, status: :created
    else
      render json: @laboratory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /laboratories/1
  # PATCH/PUT /laboratories/1.json

  def update

    @laboratory = Laboratory.find(params[:id])

    if @laboratory.update!(laboratory_params)
      render json: @laboratory
    else 
      render json: @laboratory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /laboratories/1
  # DELETE /laboratories/1.json

  def destroy
    laboratory_id = params[:id]

    begin
      @laboratory = Laboratory.find(laboratory_id)

      @laboratory.delete if @laboratory.status == true
      render json: "#{@laboratory.nome} deletado com sucesso!"

    rescue ActiveRecord::RecordNotFound
      render json: 'esse dado já foi deletado!'
    end
  end


  private

  def set_laboratories
    @laboratory = Laboratory.find(params[:id])
  end

  def laboratory_params
    params.permit(:nome, :endereco, :status)
  end
end
