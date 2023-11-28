require "test_helper"

class FornecedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedore = fornecedores(:one)
  end

  test "should get index" do
    get fornecedores_url
    assert_response :success
  end

  test "should get new" do
    get new_fornecedore_url
    assert_response :success
  end

  test "should create fornecedore" do
    assert_difference("Fornecedore.count") do
      post fornecedores_url, params: { fornecedore: {  } }
    end

    assert_redirected_to fornecedore_url(Fornecedore.last)
  end

  test "should show fornecedore" do
    get fornecedore_url(@fornecedore)
    assert_response :success
  end

  test "should get edit" do
    get edit_fornecedore_url(@fornecedore)
    assert_response :success
  end

  test "should update fornecedore" do
    patch fornecedore_url(@fornecedore), params: { fornecedore: {  } }
    assert_redirected_to fornecedore_url(@fornecedore)
  end

  test "should destroy fornecedore" do
    assert_difference("Fornecedore.count", -1) do
      delete fornecedore_url(@fornecedore)
    end

    assert_redirected_to fornecedores_url
  end
end
