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
  def go(:get, make) when is_list(make) do
    go_loop(:get, make)
  end

  @doc false
  def go(:post, make) when is_list(make) do
    go_loop(:post, make)
  end

  @doc false
  def go(:get, make), do: get_now(make)

  @doc false
  def go(:post, make), do: post_now(make)

  #
  # Private
  #

  # Recursively step through each item in the list

  defp get_now({client, url}) do
    Tesla.get(client, url)
  end

  defp post_now({client, url, post_body}) do
    Tesla.post(client, url, post_body)
  end

  defp go_loop(_method, [], accumulator), do: accumulator

  defp go_loop(method, [head | tail], accumulator \\ []) do
    {:ok, new} = go(method, head)
    new_accumulator = [new] ++ accumulator
    go_loop({method, tail}, new_accumulator)
  end
end
