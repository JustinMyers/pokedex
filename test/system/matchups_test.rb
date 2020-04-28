require "application_system_test_case"

class MatchupsTest < ApplicationSystemTestCase
  setup do
    @matchup = matchups(:one)
  end

  test "visiting the index" do
    visit matchups_url
    assert_selector "h1", text: "Matchups"
  end

  test "creating a Matchup" do
    visit matchups_url
    click_on "New Matchup"

    fill_in "Attacking pokemon type", with: @matchup.attacking_pokemon_type_id
    fill_in "Defending pokemon type", with: @matchup.defending_pokemon_type_id
    fill_in "Effectiveness", with: @matchup.effectiveness
    click_on "Create Matchup"

    assert_text "Matchup was successfully created"
    click_on "Back"
  end

  test "updating a Matchup" do
    visit matchups_url
    click_on "Edit", match: :first

    fill_in "Attacking pokemon type", with: @matchup.attacking_pokemon_type_id
    fill_in "Defending pokemon type", with: @matchup.defending_pokemon_type_id
    fill_in "Effectiveness", with: @matchup.effectiveness
    click_on "Update Matchup"

    assert_text "Matchup was successfully updated"
    click_on "Back"
  end

  test "destroying a Matchup" do
    visit matchups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Matchup was successfully destroyed"
  end
end
