defmodule Shopiex.DefaultsTest do
  use ExUnit.Case, async: true
  import Shopiex.Defaults

  test "user_agent" do
    assert(user_agent() == {"User-agent", "Shopiex"})
  end

  test "version" do
    assert(version() == Shopiex.Mixfile.project[:version])
  end

  test "min_elixir" do
    assert("~> " <> min_elixir() == Shopiex.Mixfile.project[:elixir])
  end
end
