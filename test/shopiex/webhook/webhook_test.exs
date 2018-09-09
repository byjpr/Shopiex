defmodule Shopiex.WebhookTest do
  use ExUnit.Case, async: true
  import Shopiex.Webhooks

  test "Webhooks.create" do
    {_client, object, _body} = Shopiex.client("test-store", "token")
    |> create(address: "address", topic: "topic")

    assert(object == "/admin/webhooks.json")
  end

end
