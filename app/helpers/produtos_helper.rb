module ProdutosHelper

  def produtos(selected_produto: nil)
    list = Produto.all.order(:descricao).limit(25)
    return [selected_produto] + list if selected_produto.present? && !list.map(&:id).include?(selected_produto.id)

    list
  end
end
