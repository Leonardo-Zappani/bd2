require "application_system_test_case"

class FornecedoresTest < ApplicationSystemTestCase
  setup do
    @fornecedore = fornecedores(:one)
  end

  test "visiting the index" do
    visit fornecedores_url
    assert_selector "h1", text: "Fornecedores"
  end

  test "should create fornecedore" do
    visit fornecedores_url
    click_on "New fornecedore"

    click_on "Create Fornecedore"

    assert_text "Fornecedore was successfully created"
    click_on "Back"
  end

  test "should update Fornecedore" do
    visit fornecedore_url(@fornecedore)
    click_on "Edit this fornecedore", match: :first

    click_on "Update Fornecedore"

    assert_text "Fornecedore was successfully updated"
    click_on "Back"
  end

  test "should destroy Fornecedore" do
    visit fornecedore_url(@fornecedore)
    click_on "Destroy this fornecedore", match: :first

    assert_text "Fornecedore was successfully destroyed"
  end
end
