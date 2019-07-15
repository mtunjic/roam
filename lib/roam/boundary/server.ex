defmodule Roam.Boundary.Server do
  alias Roam.Core.Rover

  # TODO: API 
  # def start(...)
  # def state(server), do: ...
  # def move(server, move), do: ...

  # mimic otp
  def run(rover) do
    run(listen(rover))
  end

  def listen(rover) do
    receive do
      {:move, move} ->
        Rover.move(rover, move)

      {:state, from} ->
        send(from, rover)
        rover
    end
  end
end
