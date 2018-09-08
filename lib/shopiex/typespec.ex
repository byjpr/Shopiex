defmodule Shopiex.Typespec do
  @moduledoc false

  @type client :: Tesla.Client.t()
  @type return_tuple :: {client, String.t()}

  @type metafield :: [
    limit: non_neg_integer(),
    since_id: non_neg_integer(),
    created_at_min: String.t(),
    created_at_max: String.t(),
    updated_at_min: String.t(),
    updated_at_max: String.t(),
    namespace: String.t(),
    key: String.t(),
    value_type: String.t(),
    fields: String.t()
  ]

end
