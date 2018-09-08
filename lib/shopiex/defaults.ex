defmodule Shopiex.Defaults do
  @moduledoc false

  def user_agent, do: {"User-agent", "Shopiex"}
  def version, do: "0.1.0"
  def min_elixir, do: "1.5"

  defmodule PageSize do
    def product_listings, do: 250
    def product_listings_ids, do: 10000
  end
end
