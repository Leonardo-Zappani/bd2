class FornecedoresController < ApplicationController
  before_action :set_fornecedore, only: %i[ show edit update destroy ]

  # GET /fornecedores or /fornecedores.json
  def index
    @fornecedores = Fornecedore.all
  end

  # GET /fornecedores/1 or /fornecedores/1.json
  def show
  end

  # GET /fornecedores/new
  def new
    @fornecedore = Fornecedore.new
  end

  # GET /fornecedores/1/edit
  def edit
  end

  # POST /fornecedores or /fornecedores.json
  def create
    @fornecedore = Fornecedore.new(fornecedore_params)

    respond_to do |format|
      if @fornecedore.save
        format.html { redirect_to fornecedore_url(@fornecedore), notice: "Fornecedore was successfully created." }
        format.json { render :show, status: :created, location: @fornecedore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fornecedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedores/1 or /fornecedores/1.json
  def update
    respond_to do |format|
      if @fornecedore.update(fornecedore_params)
        format.html { redirect_to fornecedore_url(@fornecedore), notice: "Fornecedore was successfully updated." }
        format.json { render :show, status: :ok, location: @fornecedore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fornecedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores/1 or /fornecedores/1.json
  def destroy
    @fornecedore.destroy

    respond_to do |format|
      format.html { redirect_to fornecedores_url, notice: "Fornecedore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedore
      @fornecedore = Fornecedore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fornecedore_params
      params.fetch(:fornecedore, {})
    end
end
