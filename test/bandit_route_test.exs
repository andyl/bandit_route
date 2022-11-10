defmodule BanditRouteTest do
  use ExUnit.Case
  doctest BanditRoute

  test "greets the world" do
    assert BanditRoute.hello() == :world
  end
end
