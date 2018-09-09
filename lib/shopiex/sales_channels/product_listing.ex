defmodule Shopiex.SalesChannels.ProductListing do
  @moduledoc """
  A ProductListing resource represents a Product which is available to your sales channel.
  You can use this resource to retrieve products that a merchant has published and display them to customers in your marketplace for sale.

  A ProductListing resource itself is unable to have its attributes modified directly. All attributes of a ProductListing should be considered read-only.
  """

  @type listing_options :: [
    product_ids: String.t(),
    limit: non_neg_integer(),
    page: non_neg_integer(),
    collection_id: non_neg_integer(),
    updated_at_min: String.t(),
    handle: String.t()
  ]

  @type listing_ids_opts :: [
    limit: non_neg_integer(),
    page: non_neg_integer()
  ]

  @doc """
  Retrieve a specific product listing that is published to your app
  """
  @spec get_by_id(client :: Shopiex.client, non_neg_integer()) :: Shopiex.return_tuple
  def get_by_id(client, product_listing_id),
    do:
      {client,
       "/admin/product_listings/#{product_listing_id}.json"}

  @doc """
  Retrieve product listings that are published to your app.
  """
  @spec get(client :: Shopiex.client(), listing_options()) :: Shopiex.return_tuple()
  def get(client, opts \\ []),
    do: {client, "/admin/product_listings.json#{flatten_options(opts)}"}

  @doc """
  Retrieve product_ids that are published to your app. Maximum 10,000 results per page.
  """
  @spec get_ids(client :: Shopiex.client(), listing_ids_opts()) :: Shopiex.return_tuple()
  def get_ids(client, opts \\ []),
    do: {client, "/admin/product_listings/product_ids.json#{flatten_options(opts)}"}

  @doc """
  Retrieve a count of products that are published to your app
  """
  @spec get_count(client :: Shopiex.client()) :: Shopiex.return_tuple()
  def get_count(client), do: {client, "/admin/product_listings/count.json"}

  defp flatten_options([]), do: ""
  defp flatten_options(options),
    do: "?" <> Shopiex.BuildParams.build_and_join(options)
end
