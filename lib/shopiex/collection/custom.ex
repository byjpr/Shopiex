defmodule Shopiex.Collection.Custom do
  @moduledoc """
  Manage a store's custom collections. A custom collection is one where products are included manually, as opposed to being included automatically because they meet selection conditions.

  Collections are typically displayed to customers so that buyers can select to view only the products in the collection. Shopify stores start with a single custom collection called frontpage—the collection of products shown on the front page of the online store.
  """

  @doc """
  Get the collect by page enum
  """
  @spec get(client :: Shopiex.client(), non_neg_integer()) :: Shopiex.return_tuple()
  def get(client, page),
    do:
      {client, "/admin/custom_collections.json&page=#{page}"}

  @doc """
  Get the count of custom collections in a shop
  """
  @spec count(client :: Shopiex.client()) :: Shopiex.return_tuple()
  def count(client), do: {client, "/admin/custom_collections/count.json"}

  @doc """
  Get the count of custom collections in a shop that were published after timestamp
  """
  @spec count_published_after(client :: Shopiex.client(), String.t()) :: Shopiex.return_tuple()
  def count_published_after(client, timestamp),
    do: {client, "/admin/custom_collections/count.json?published_at_min=#{timestamp}"}

  @doc """
  Get the count of custom collections in a shop that were published before timestamp
  """
  @spec count_published_before(client :: Shopiex.client(), String.t()) :: Shopiex.return_tuple()
  def count_published_before(client, timestamp),
    do: {client, "/admin/custom_collections/count.json?published_at_max=#{timestamp}"}

  @doc """
  Get the count of custom collections in a shop that were last updated after timestamp
  """
  @spec count_updated_after(client :: Shopiex.client(), String.t()) :: Shopiex.return_tuple()
  def count_updated_after(client, timestamp),
    do: {client, "/admin/custom_collections/count.json?updated_at_min=#{timestamp}"}

  @doc """
  Get the count of custom collections in a shop that were last updated before timestamp
  """
  @spec count_updated_before(client :: Shopiex.client(), String.t()) :: Shopiex.return_tuple()
  def count_updated_before(client, timestamp),
    do: {client, "/admin/custom_collections/count.json?updated_at_max=#{timestamp}"}

  @doc """
  Get collects that belong to a collection id enumerated by page
  """
  @spec get_by_product(client :: Shopiex.client(), non_neg_integer(), non_neg_integer()) :: Shopiex.return_tuple()
  def get_by_product(client, product, page),
    do:
      {client,
       "/admin/custom_collections.json&page=#{page}&product_id=#{
         product
       }"}
end
