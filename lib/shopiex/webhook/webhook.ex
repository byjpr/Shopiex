defmodule Shopiex.Webhooks do
  @moduledoc """
  Register webhooks to keep your app synced with the merchant store.
  """

  @doc """
  Create a new webhook subscription by specifying both an address and a topic
  """
  def create(client, [address: address, topic: topic] = _required_opts, opts \\ []) do
    {client,
      "/admin/webhooks.json",
      %{
        address: address,
        topic: topic,
        format: "json"
      }
    }
  end
end
