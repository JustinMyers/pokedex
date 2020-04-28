require "application_system_test_case"

class PokemonTest < ApplicationSystemTestCase
  setup do
    @pokemon = pokemon(:one)
  end

  test "visiting the index" do
    visit pokemon_url
    assert_selector "h1", text: "Pokemon"
  end

  test "creating a Pokemon" do
    visit pokemon_url
    click_on "New Pokemon"

    fill_in "Ancestor", with: @pokemon.ancestor_id
    fill_in "Attack", with: @pokemon.attack
    check "Caught" if @pokemon.caught
    fill_in "Defense", with: @pokemon.defense
    fill_in "Gen", with: @pokemon.gen
    check "Legendary" if @pokemon.legendary
    fill_in "Name", with: @pokemon.name
    fill_in "Pokedexnumber", with: @pokemon.pokedexNumber
    fill_in "Stamina", with: @pokemon.stamina
    click_on "Create Pokemon"

    assert_text "Pokemon was successfully created"
    click_on "Back"
  end

  test "updating a Pokemon" do
    visit pokemon_url
    click_on "Edit", match: :first

    fill_in "Ancestor", with: @pokemon.ancestor_id
    fill_in "Attack", with: @pokemon.attack
    check "Caught" if @pokemon.caught
    fill_in "Defense", with: @pokemon.defense
    fill_in "Gen", with: @pokemon.gen
    check "Legendary" if @pokemon.legendary
    fill_in "Name", with: @pokemon.name
    fill_in "Pokedexnumber", with: @pokemon.pokedexNumber
    fill_in "Stamina", with: @pokemon.stamina
    click_on "Update Pokemon"

    assert_text "Pokemon was successfully updated"
    click_on "Back"
  end

  test "destroying a Pokemon" do
    visit pokemon_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pokemon was successfully destroyed"
  end
end
