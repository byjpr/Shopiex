defmodule Shopiex.Meta do
  @moduledoc """
  Access a store's general settings and information as configured by the merchant in their Shopify admin.
  """

  @doc """
  Get shop details
  """
  @spec shop_details(client :: Shopiex.Typespec.client) :: Shopiex.Typespec.return_tuple
  def shop_details(client), do: {client, "/admin/shop.json"}

  def shop_metafields(client, options),
    do: {client, "/admin/metafields.json?#{flatten_options(options)}"}

  defp flatten_options(options),
    do: Shopiex.BuildParams.build_and_join(options)
end
