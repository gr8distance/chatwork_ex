defmodule ChatworkExTest do
  use ExUnit.Case
  doctest ChatworkEx

  test "greets the world" do
    assert ChatworkEx.hello() == :world
  end
end
