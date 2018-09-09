defmodule Shopiex.Collection.Collect do
  @moduledoc """
  Collects are meant for managing the relationship between products and custom collections. For every product in a custom collection there is a collect that tracks the ID of both the product and the custom collection. A product can be in more than one collection, and will have a collect connecting it to each collection. Unlike many Shopify resources, collects aren't apparent to store owners.

  Collects are for placing products in custom collections only. Smart collections use rules to determine which products are their members. Creating a collect that links a product to a smart collection results in a 403 Forbidden error.
  """

  @doc """
  Get the count of collects in a shop
  """
  @spec count(client :: Shopiex.client()) :: Shopiex.return_tuple()
  def count(client), do: {client, "/admin/collects/count.json"}

  @doc """
  Get the collect by page enum
  """
  @spec get(client :: Shopiex.client(), page :: non_neg_integer()) :: Shopiex.return_tuple()
  def get(client, page),
    do: {client, "/admin/collects.json&page=#{page}"}

  @doc """
  Get collects that belong to a collection id enumerated by page
  """
  @spec get_by_collection(
          client :: Shopiex.client(),
          collection_id :: non_neg_integer(),
          page :: non_neg_integer()
        ) :: Shopiex.return_tuple()
  def get_by_collection(client, collection_id, page),
    do:
      {client,
       "/admin/collects.json&page=#{page}&collection_id=#{
         collection_id
       }"}
end
