defmodule Shopiex do
  @moduledoc """
  Provides access interfaces for the Shopify API.
  """

  @type client :: Tesla.Client.t()
  @type request_method :: :get | :put | :post | :delete | :put | :patch | :head
  @type return_tuple :: {client, String.t()}
  @type make :: {client :: Tesla.Client.t(), url :: String.t()}

  @type metafield :: [
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
  Creates a Tesla client
  """
  @spec client(shop :: String.t(), token :: String.t()) :: Tesla.Client.t()
  def client(shop, token) do
    Tesla.build_client([
      {Tesla.Middleware.Headers,
       [{"X-Shopify-Access-Token", token}, Shopiex.Defaults.user_agent]},
      {Tesla.Middleware.BaseUrl, "https://" <> shop <> ".myshopify.com"},
      {Tesla.Middleware.JSON, []}
    ])
  end

  @doc """
		go/2 when make is list
	"""
  @spec go(method :: :get, make :: nonempty_list(Shopiex.make)) :: any()
  def go(:get, make) when is_list(make) do
    go_loop(:get, make)
  end

  @doc """
		go/2 when make is list
	"""
  @spec go(method :: :post, make :: nonempty_list(Shopiex.make)) :: any()
  def go(:post, make) when is_list(make) do
    go_loop(:post, make)
  end

  @doc """
		go/2
	"""
  @spec go(method :: :get, make :: Shopiex.make) :: any()
  def go(:get, {client, url}) do
    Tesla.get(client, url)
  end

	@doc """
		go/2
	"""
  @spec go(method :: :post, make :: Shopiex.make) :: any()
  def go(:post, {client, url, post_body}) do
    Tesla.post(client, url, post_body)
  end

  #
  # Private
  #
  @spec go_loop(
    method :: :get | :post,
    requests :: [],
    accumulator :: [...]
  ) :: any()
  defp go_loop(_method, [], accumulator), do: accumulator

  @spec go_loop(
    method :: :get | :post,
    requests :: nonempty_list(make :: Shopiex.make),
    accumulator :: [...] | []
  ) :: any()
  defp go_loop(method, requests, accumulator \\ [])
  defp go_loop(method, [head | tail], accumulator) do
    {:ok, new} = go(method, head)
    new_accumulator = [new] ++ accumulator
    go_loop(method, tail, new_accumulator)
  end
end
