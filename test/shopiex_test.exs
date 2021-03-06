defmodule ShopiexTest do
  use ExUnit.Case, async: true
  import Shopiex.BuildParams

  import Tesla.Mock

  setup do
    mock fn env ->
      case env.url do
        "https://valid_store.myshopify.com/admin/shop.json" ->
          %Tesla.Env{status: 200, body: "ok"}
        "https://valid_store.myshopify.com/admin/webhooks.json" ->
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

  test "Get is_list" do
    request = Shopiex.client("valid_store", "token")
    |> Shopiex.Meta.shop_details()

    assert [%Tesla.Env{}, %Tesla.Env{}] = Shopiex.go(:get, [request, request])
  end

  test "Post" do
    request = Shopiex.client("valid_store", "token")
    |> Shopiex.Webhooks.create(address: "address", topic: "topic")

    assert {:ok, %Tesla.Env{} = env} = Shopiex.go(:post, request)
    assert env.status == 200
    assert env.body == "ok"
  end

  test "Post is_list" do
    request = Shopiex.client("valid_store", "token")
    |> Shopiex.Webhooks.create(address: "address", topic: "topic")

    assert [%Tesla.Env{}, %Tesla.Env{}] = Shopiex.go(:post, [request, request])
  end
end
