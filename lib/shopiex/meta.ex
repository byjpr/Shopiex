defmodule Shopiex.Meta do
  @moduledoc """
  Access a store's general settings and information as configured by the merchant in their Shopify admin.
  """

  @type metafield_options :: [
    limit: non_neg_integer(),
    since_id: non_neg_integer(),
    created_at_min: String.t(),
    created_at_max: String.t(),
    updated_at_min: String.t(),
    updated_at_max: String.t(),
    namespace: String.t(),
    key: String.t(),
    value_type: String.t(),
    fields: String.t()
  ]

  @doc """
  Get shop details
  """
  @spec shop_details(client :: Shopiex.client) :: Shopiex.return_tuple
  def shop_details(client), do: {client, "/admin/shop.json"}

  @spec shop_metafields(client :: Shopiex.client, metafield_options) :: Shopiex.return_tuple
  def shop_metafields(client, options),
    do: {client, "/admin/metafields.json?#{flatten_options(options)}"}

  defp flatten_options(options),
    do: Shopiex.BuildParams.build_and_join(options)
end
