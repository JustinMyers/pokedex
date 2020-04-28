require 'test_helper'

class MovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @move = moves(:one)
  end

  test "should get index" do
    get moves_url
    assert_response :success
  end

  test "should get new" do
    get new_move_url
    assert_response :success
  end

  test "should create move" do
    assert_difference('Move.count') do
      post moves_url, params: { move: { category: @move.category, cooldown: @move.cooldown, damage_window_max: @move.damage_window_max, damage_window_min: @move.damage_window_min, energy: @move.energy, name: @move.name, pokemon_type_id: @move.pokemon_type_id, power: @move.power, pvp_energy: @move.pvp_energy, pvp_power: @move.pvp_power, pvp_turns: @move.pvp_turns, weather: @move.weather } }
    end

    assert_redirected_to move_url(Move.last)
  end

  test "should show move" do
    get move_url(@move)
    assert_response :success
  end

  test "should get edit" do
    get edit_move_url(@move)
    assert_response :success
  end

  test "should update move" do
    patch move_url(@move), params: { move: { category: @move.category, cooldown: @move.cooldown, damage_window_max: @move.damage_window_max, damage_window_min: @move.damage_window_min, energy: @move.energy, name: @move.name, pokemon_type_id: @move.pokemon_type_id, power: @move.power, pvp_energy: @move.pvp_energy, pvp_power: @move.pvp_power, pvp_turns: @move.pvp_turns, weather: @move.weather } }
    assert_redirected_to move_url(@move)
  end

  test "should destroy move" do
    assert_difference('Move.count', -1) do
      delete move_url(@move)
    end

    assert_redirected_to moves_url
  end
end
