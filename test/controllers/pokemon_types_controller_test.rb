require 'test_helper'

class PokemonTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_type = pokemon_types(:one)
  end

  test "should get index" do
    get pokemon_types_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_type_url
    assert_response :success
  end

  test "should create pokemon_type" do
    assert_difference('PokemonType.count') do
      post pokemon_types_url, params: { pokemon_type: { name: @pokemon_type.name } }
    end

    assert_redirected_to pokemon_type_url(PokemonType.last)
  end

  test "should show pokemon_type" do
    get pokemon_type_url(@pokemon_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_type_url(@pokemon_type)
    assert_response :success
  end

  test "should update pokemon_type" do
    patch pokemon_type_url(@pokemon_type), params: { pokemon_type: { name: @pokemon_type.name } }
    assert_redirected_to pokemon_type_url(@pokemon_type)
  end

  test "should destroy pokemon_type" do
    assert_difference('PokemonType.count', -1) do
      delete pokemon_type_url(@pokemon_type)
    end

    assert_redirected_to pokemon_types_url
  end
end
