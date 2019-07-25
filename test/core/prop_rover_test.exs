defmodule PropRoverTest do
  use ExUnit.Case
  use PropCheck

  # TODO: 
  # property "moves around" do
  #   forall x <- list() do
  #     ...
  #   end
  # end

  # ==================================================
  # Helpers
  # ===================================================
  def step, do: oneof([:l, :r, :u, :d])

  def path, do: list(step())
end
