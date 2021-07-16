Shopiex was a fun idea, but GraphQL is much better.

-------

# Shopiex

[![Build Status](https://travis-ci.com/byjord/Shopiex.svg?branch=master)](https://travis-ci.com/byjord/Shopiex)
[![Coverage Status](https://coveralls.io/repos/byjord/Shopiex/badge.svg?branch=master)](https://coveralls.io/github/byjord/Shopiex?branch=master)

Simple elixir wrapper for the Shopify API.

## Quick Start

Add Shopiex to your mix.exs. Currently only on GitHub:

```elixir
def deps do
  [{:Shopiex, github: "https://github.com/byjord/Shopiex"}]
end
```

Fetching dependencies and running on elixir console:

```console
$ mix deps.get
$ iex -S mix
```


## Supported Endpoints

- [ ] REST Admin API
	- [ ] Access
		- [ ] AccessScope
		- [ ] StorefrontAccessToken
	- ~Analytics~
		- Not supported because ShopifyQL
	- [ ] Billing
		- [ ] UsageCharge
		- [ ] ApplicationCredit
		- [ ] ApplicationCharge
		- [ ] RecurringApplicationCharge
	- [ ] Customers
		- [ ] Customer Address
		- [ ] Customer
		- [ ] CustomerSavedSearch
	- [ ] Discounts
		- [ ] PriceRule
		- [ ] DiscountCode
	- [ ] Events
		- [ ] Webhook
		- [ ] Event
	- [ ] Inventory
		- [ ] InventoryItem
		- [ ] Location
		- [ ] InventoryLevel
	- [ ] MarketingEvent
	- [ ] Metafield
	- [ ] Online store
		- [ ] Asset
		- [ ] Blog
		- [ ] Blog Article
		- [ ] Comment
		- [ ] Page
		- [ ] Redirect
		- [ ] ScriptTag
		- [ ] Theme
	- [ ] Orders
		- [ ] Abandoned checkouts
		- [ ] DraftOrder
		- [ ] Order
		- [ ] Order Risk
		- [ ] Refund
		- [ ] Transaction
	- [ ] Plus
		- [ ] Gift Card
		- [ ] Multipass
		- [ ] User
	- [ ] Products
		- [ ] Collect
		- [ ] CustomCollection
		- [ ] Product
		- [ ] Product Image
		- [ ] Product Variant
		- [ ] SmartCollection
	- [ ] Sales channel
		- [ ] Checkout
		- [ ] CollectionListing
		- [ ] Payment
		- [ ] ProductListing
		- [ ] ResourceFeedback
	- [ ] Shipping and fulfillment
		- [ ] CarrierService
		- [ ] Fulfillment
		- [ ] FulfillmentEvent
		- [ ] FulfillmentService
	- [ ] Store properties
		- [ ] Country
		- [ ] Policy
		- [ ] Province
		- [ ] Shipping Zone
		- [ ] Shop
