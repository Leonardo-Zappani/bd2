module FuncionariosHelper

  def funcionarios(selected_funcionario: nil)
    list = Funcionario.all.order(:nome).limit(25)
    return [selected_funcionario] + list if selected_funcionario.present? && !list.map(&:id).include?(selected_funcionario.id)

    list
  end
end
