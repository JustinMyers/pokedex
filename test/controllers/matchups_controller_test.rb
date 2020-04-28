require 'test_helper'

class MatchupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matchup = matchups(:one)
  end

  test "should get index" do
    get matchups_url
    assert_response :success
  end

  test "should get new" do
    get new_matchup_url
    assert_response :success
  end

  test "should create matchup" do
    assert_difference('Matchup.count') do
      post matchups_url, params: { matchup: { attacking_pokemon_type_id: @matchup.attacking_pokemon_type_id, defending_pokemon_type_id: @matchup.defending_pokemon_type_id, effectiveness: @matchup.effectiveness } }
    end

    assert_redirected_to matchup_url(Matchup.last)
  end

  test "should show matchup" do
    get matchup_url(@matchup)
    assert_response :success
  end

  test "should get edit" do
    get edit_matchup_url(@matchup)
    assert_response :success
  end

  test "should update matchup" do
    patch matchup_url(@matchup), params: { matchup: { attacking_pokemon_type_id: @matchup.attacking_pokemon_type_id, defending_pokemon_type_id: @matchup.defending_pokemon_type_id, effectiveness: @matchup.effectiveness } }
    assert_redirected_to matchup_url(@matchup)
  end

  test "should destroy matchup" do
    assert_difference('Matchup.count', -1) do
      delete matchup_url(@matchup)
    end

    assert_redirected_to matchups_url
  end
end
