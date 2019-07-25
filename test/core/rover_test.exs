defmodule RoamRoverTest do
  use ExUnit.Case
  alias Roam.Core.Rover
  # import Roam.Core.Rover

  # TODO:  Property-Based Testing, Server test

  test "new" do
    assert Rover.new() == %Rover{moves: [], orientation: :north, position: {0, 0}}
  end

  # ============================. new fancy tests =========================================

  test "moves around a bit" do
    Rover.new()
    |> Rover.move(?r)
    |> assert_field_value(:orientation, :east)
    |> Rover.move(?f)
    |> assert_field_value(:position, {1, 0})
    |> Rover.move(?r)
    |> assert_field_value(:orientation, :south)
    |> Rover.move(?f)
    |> assert_field_value(:position, {1, -1})
    |> Rover.move(?l)
    |> assert_field_value(:orientation, :east)
  end

  def assert_field_value(rover, field, expected_value) do
    actual_value = Map.get(rover, field)
    assert actual_value == expected_value
    rover
  end

  # ================.  ugly old-fashioned tests =========================================
  test "move right once" do
    expected = Rover.new() |> Rover.move(?r)
    actual = %Rover{moves: 'r', orientation: :east}
    assert expected == actual
  end

  test "move right n times" do
    assert %Rover{moves: 'rrr', orientation: :west} ==
             Rover.new() |> Rover.move(?r) |> Rover.move(?r) |> Rover.move(?r)
  end

  test "move left once" do
    assert %Rover{moves: 'l', orientation: :west} == Rover.new() |> Rover.move(?l)
  end

  test "move left n times" do
    assert %Rover{moves: 'lll', orientation: :east} ==
             Rover.new() |> Rover.move(?l) |> Rover.move(?l) |> Rover.move(?l)
  end

  test "move forward once" do
    assert %Rover{moves: 'frr', orientation: :south, position: {0, -1}} ==
             Rover.new() |> Rover.move(?r) |> Rover.move(?r) |> Rover.move(?f)
  end
end
