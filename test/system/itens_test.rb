require "application_system_test_case"

class ItensTest < ApplicationSystemTestCase
  setup do
    @iten = itens(:one)
  end

  test "visiting the index" do
    visit itens_url
    assert_selector "h1", text: "Itens"
  end

  test "should create iten" do
    visit itens_url
    click_on "New iten"

    click_on "Create Iten"

    assert_text "Iten was successfully created"
    click_on "Back"
  end

  test "should update Iten" do
    visit iten_url(@iten)
    click_on "Edit this iten", match: :first

    click_on "Update Iten"

    assert_text "Iten was successfully updated"
    click_on "Back"
  end

  test "should destroy Iten" do
    visit iten_url(@iten)
    click_on "Destroy this iten", match: :first

    assert_text "Iten was successfully destroyed"
  end
end
