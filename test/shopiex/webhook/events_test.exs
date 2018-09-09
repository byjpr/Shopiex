defmodule Shopiex.EventsTest do
  use ExUnit.Case, async: true
  import Shopiex.Events

  describe "Events.all" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = all(client, verb: "verb", filter: "filter")
      assert(object == "/admin/events.json?verb=verb&filter=filter")
    end

    test "Events.all, limit 100" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = all(client, verb: "verb", filter: "filter", limit: 100)
      assert(object == "/admin/events.json?verb=verb&filter=filter&limit=100")
    end

    test "Events.all, created_at_min" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = all(client, verb: "verb", filter: "filter", created_at_min: "2014-04-25T16:15:47-04:00")
      assert(object == "/admin/events.json?verb=verb&filter=filter&created_at_min=2014-04-25T16:15:47-04:00")
    end

    test "Events.all, created_at_max" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = all(client, verb: "verb", filter: "filter", created_at_max: "2014-04-25T16:15:47-04:00")
      assert(object == "/admin/events.json?verb=verb&filter=filter&created_at_max=2014-04-25T16:15:47-04:00")
    end
  end

  describe "Events.product_events" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = product_events(client, "092349032", verb: "verb", filter: "filter")
      assert(object == "/admin/products/092349032/events.json?verb=verb&filter=filter")
    end

    test "limit 100" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = product_events(client, "092349032", verb: "verb", filter: "filter", limit: 100)
      assert(object == "/admin/products/092349032/events.json?verb=verb&filter=filter&limit=100")
    end

    test "created_at_min" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = product_events(client, "092349032", verb: "verb", filter: "filter", created_at_min: "2014-04-25T16:15:47-04:00")
      assert(object == "/admin/products/092349032/events.json?verb=verb&filter=filter&created_at_min=2014-04-25T16:15:47-04:00")
    end

    test "created_at_max" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = product_events(client, "092349032", verb: "verb", filter: "filter", created_at_max: "2014-04-25T16:15:47-04:00")
      assert(object == "/admin/products/092349032/events.json?verb=verb&filter=filter&created_at_max=2014-04-25T16:15:47-04:00")
    end
  end

  describe "Events.order_events" do
    test "Base" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = order_events(client, "092349032", verb: "verb", filter: "filter")
      assert(object == "/admin/order/092349032/events.json?verb=verb&filter=filter")
    end

    test "limit 100" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = order_events(client, "092349032", verb: "verb", filter: "filter", limit: 100)
      assert(object == "/admin/order/092349032/events.json?verb=verb&filter=filter&limit=100")
    end

    test "created_at_min" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = order_events(client, "092349032", verb: "verb", filter: "filter", created_at_min: "2014-04-25T16:15:47-04:00")
      assert(object == "/admin/order/092349032/events.json?verb=verb&filter=filter&created_at_min=2014-04-25T16:15:47-04:00")
    end

    test "created_at_max" do
      client = Shopiex.client("test-store", "token")
      assert {_client, object, _body} = order_events(client, "092349032", verb: "verb", filter: "filter", created_at_max: "2014-04-25T16:15:47-04:00")
      assert(object == "/admin/order/092349032/events.json?verb=verb&filter=filter&created_at_max=2014-04-25T16:15:47-04:00")
    end
  end

end
