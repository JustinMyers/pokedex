require "application_system_test_case"

class MovesTest < ApplicationSystemTestCase
  setup do
    @move = moves(:one)
  end

  test "visiting the index" do
    visit moves_url
    assert_selector "h1", text: "Moves"
  end

  test "creating a Move" do
    visit moves_url
    click_on "New Move"

    fill_in "Category", with: @move.category
    fill_in "Cooldown", with: @move.cooldown
    fill_in "Damage window max", with: @move.damage_window_max
    fill_in "Damage window min", with: @move.damage_window_min
    fill_in "Energy", with: @move.energy
    fill_in "Name", with: @move.name
    fill_in "Pokemon type", with: @move.pokemon_type_id
    fill_in "Power", with: @move.power
    fill_in "Pvp energy", with: @move.pvp_energy
    fill_in "Pvp power", with: @move.pvp_power
    fill_in "Pvp turns", with: @move.pvp_turns
    fill_in "Weather", with: @move.weather
    click_on "Create Move"

    assert_text "Move was successfully created"
    click_on "Back"
  end

  test "updating a Move" do
    visit moves_url
    click_on "Edit", match: :first

    fill_in "Category", with: @move.category
    fill_in "Cooldown", with: @move.cooldown
    fill_in "Damage window max", with: @move.damage_window_max
    fill_in "Damage window min", with: @move.damage_window_min
    fill_in "Energy", with: @move.energy
    fill_in "Name", with: @move.name
    fill_in "Pokemon type", with: @move.pokemon_type_id
    fill_in "Power", with: @move.power
    fill_in "Pvp energy", with: @move.pvp_energy
    fill_in "Pvp power", with: @move.pvp_power
    fill_in "Pvp turns", with: @move.pvp_turns
    fill_in "Weather", with: @move.weather
    click_on "Update Move"

    assert_text "Move was successfully updated"
    click_on "Back"
  end

  test "destroying a Move" do
    visit moves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Move was successfully destroyed"
  end
end
