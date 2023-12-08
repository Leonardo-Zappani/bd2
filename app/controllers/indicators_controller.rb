class IndicatorsController < ApplicationController


  def index
    @recent_funcionarios = Funcionario.all.order(created_at: :desc).limit(10)
  end

  def show; end

end