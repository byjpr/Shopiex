defmodule Shopiex.SalesChannels.ProductListingTest do
  use ExUnit.Case, async: true
  import Shopiex.SalesChannels.ProductListing

  describe "get_by_id" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object} = get_by_id(client, "0123456789")
      assert(object == "/admin/product_listings/0123456789.json")
    end
  end

  describe "get" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object} = get(client)
      assert(object == "/admin/product_listings.json")
    end
  end

  describe "get_ids" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object} = get_ids(client)
      assert(object == "/admin/product_listings/product_ids.json")
    end
  end

  describe "get_count" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object} = get_count(client)
      assert(object == "/admin/product_listings/count.json")
    end
  end

end
