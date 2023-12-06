# frozen_string_literal: true

  module FornecedoresHelper
    def fornecedores(selected_fornecedore: nil)
      list = Fornecedore.all.order(:descricao).limit(25)
      return [selected_fornecedore] + list if selected_fornecedore.present? && !list.map(&:id).include?(selected_fornecedore.id)

      list
    end
  end
