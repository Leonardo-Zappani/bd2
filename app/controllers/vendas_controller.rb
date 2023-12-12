class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    page = params[:page] || 1
    @vendas = Venda.all.order(created_at: :desc).limit(1000)
  end

  # GET /vendas/1 or /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas or /vendas.json
  def create
    filtered_params = venda_params
    filtered_params[:horario_venda] = Time.now
    filtered_params[:produto_id] = [filtered_params[:iten_id]]
    filtered_params[:funcionarios_id] = filtered_params[:funcionario_id]
    filtered_params.delete(:funcionario_id)
    filtered_params.delete(:iten_id)


    @venda = Venda.create!(filtered_params)

    redirect_to '/vendas'
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    filtered_params = venda_params
    filtered_params[:horario_venda] = Time.now
    filtered_params[:produto_id] = [filtered_params[:iten_id]]
    filtered_params[:funcionarios_id] = filtered_params[:funcionario_id]
    filtered_params.delete(:funcionario_id)
    filtered_params.delete(:iten_id)

    @venda.update!(filtered_params)

    redirect_to '/vendas'
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    @venda.destroy

    respond_to do |format|
      format.html { redirect_to vendas_url, notice: "Venda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_venda
    @venda = Venda.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def venda_params
    params.require(:venda).permit(:iten_id, :funcionario_id, :horario_venda, :total)
  end
end
