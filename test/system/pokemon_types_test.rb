require "application_system_test_case"

class PokemonTypesTest < ApplicationSystemTestCase
  setup do
    @pokemon_type = pokemon_types(:one)
  end

  test "visiting the index" do
    visit pokemon_types_url
    assert_selector "h1", text: "Pokemon Types"
  end

  test "creating a Pokemon type" do
    visit pokemon_types_url
    click_on "New Pokemon Type"

    fill_in "Name", with: @pokemon_type.name
    click_on "Create Pokemon type"

    assert_text "Pokemon type was successfully created"
    click_on "Back"
  end

  test "updating a Pokemon type" do
    visit pokemon_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @pokemon_type.name
    click_on "Update Pokemon type"

    assert_text "Pokemon type was successfully updated"
    click_on "Back"
  end

  test "destroying a Pokemon type" do
    visit pokemon_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pokemon type was successfully destroyed"
  end
end
