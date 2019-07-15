defmodule Roam.Core.Rover do
  defstruct(
    position: {0, 0},
    orientation: :north,
    moves: []
  )

  def new(fields \\ []), do: __struct__(fields)

  def move(rover, move) do
    # big map update
    %{
      rover
      | orientation: turn(rover.orientation, move),
        position: advance(rover.orientation, rover.position, move),
        moves: add_move(rover.moves, move)
    }
  end

  defp add_move(moves, move), do: [move | moves]

  defp turn(orientation, ?r) do
    case orientation do
      :north -> :east
      :south -> :west
      :east -> :south
      :west -> :north
    end
  end

  defp turn(orientation, ?l) do
    case orientation do
      :north -> :west
      :south -> :east
      :east -> :north
      :west -> :south
    end
  end

  defp turn(orientation, _), do: orientation

  defp advance(orientation, {x, y}, ?f) do
    case orientation do
      :north -> {x, y + 1}
      :south -> {x, y - 1}
      :east -> {x + 1, y}
      :west -> {x - 1, y}
    end
  end

  defp advance(_orientation, position, _), do: position
end
