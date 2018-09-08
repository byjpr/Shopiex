defmodule Shopiex.Webhooks do
  @moduledoc """
  Fetch event data or register webhooks to keep your app synced with the merchant store.
  """

  @doc """
  create/2
  """
  def create(client, verb: verb, filter: filter) do
    {client,
     "/admin/events.json?verb=#{verb}&filter=#{filter}",
     %{format: "json"}}
  end
end
