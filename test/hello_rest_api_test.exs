defmodule HelloRestApiTest do
  use ExUnit.Case
  doctest HelloRestApi

  test "greets the world" do
    assert HelloRestApi.hello() == :world
  end
end
