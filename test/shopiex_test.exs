defmodule ShopiexTest do
  use ExUnit.Case, async: true
  import Shopiex.BuildParams

  import Tesla.Mock

  setup do
    mock fn env ->
      case env.url do
        "https://valid_store.myshopify.com/admin/shop.json" ->
          %Tesla.Env{status: 200, body: "ok"}
        "https://valid_store.myshopify.com/admin/events.json?verb=verb&filter=filter" ->
          %Tesla.Env{status: 200, body: "ok"}
      end
    end

    :ok
  end

  test "Get" do
    request = Shopiex.client("valid_store", "token")
    |> Shopiex.Meta.shop_details()

    assert {:ok, %Tesla.Env{} = env} = Shopiex.go(:get, request)
    assert env.status == 200
    assert env.body == "ok"
  end

  test "Post" do
    request = Shopiex.client("valid_store", "token")
    |> Shopiex.Webhooks.create(verb: "verb", filter: "filter")

    assert {:ok, %Tesla.Env{} = env} = Shopiex.go(:post, request)
    assert env.status == 200
    assert env.body == "ok"
  end
end
