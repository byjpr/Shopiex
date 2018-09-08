defmodule Shopiex do
  @moduledoc false

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

  @doc false
  @spec go(method :: :get, make :: nonempty_list(Shopiex.Typespec.make)) :: any()
  def go(:get, make) when is_list(make) do
    go_loop(:get, make)
  end

  @doc false
  @spec go(method :: :post, make :: nonempty_list(Shopiex.Typespec.make)) :: any()
  def go(:post, make) when is_list(make) do
    go_loop(:post, make)
  end

  @spec go(method :: :get, make :: Shopiex.Typespec.make) :: any()
  def go(:get, {client, url}) do
    Tesla.get(client, url)
  end

  @spec go(method :: :post, make :: Shopiex.Typespec.make) :: any()
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
    requests :: nonempty_list(make :: Shopiex.Typespec.make),
    accumulator :: [...] | []
  ) :: any()
  defp go_loop(method, requests, accumulator \\ [])
  defp go_loop(method, [head | tail], accumulator) do
    {:ok, new} = go(method, head)
    new_accumulator = [new] ++ accumulator
    go_loop(method, tail, new_accumulator)
  end
end
