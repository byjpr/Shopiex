defmodule Shopiex.MetaTest do
  use ExUnit.Case, async: true
  import Shopiex.Meta

  test "shop_details" do
    {_client, object} = Shopiex.client("test-store", "token")
    |> shop_details

    assert(object == "/admin/shop.json")
  end

  describe "Testing Options on `shop_metafields`" do
    test "single" do
      {_client, object} = Shopiex.client("test-store", "token")
      |> shop_metafields([limit: 10_000])

      assert(object == "/admin/metafields.json?limit=10000")
    end

    test "multiple" do
      {_client, object} = Shopiex.client("test-store", "token")
      |> shop_metafields([limit: 10_000, since_id: 123_421_043])

      assert(object == "/admin/metafields.json?limit=10000&since_id=123421043")
    end
  end
end
