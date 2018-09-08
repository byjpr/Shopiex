defmodule Shopiex.WebhookTest do
  use ExUnit.Case, async: true
  import Shopiex.Webhooks

  test "Webhooks.create" do
    {_client, object, _body} = Shopiex.client("test-store", "token")
    |> create(verb: "verb", filter: "filter")

    assert(object == "/admin/events.json?verb=verb&filter=filter")
  end

end
