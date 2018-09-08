defmodule Shopiex.BuildParams do

  @doc false
  def build(options) do
    Enum.map(options, fn {k, v} -> stringify(k, v) end)
  end

  @doc false
  def join(options) do
    Enum.join(options, "&")
  end

  @doc false
  def build_and_join(options) do
    options
    |> build
    |> join
  end

  defp stringify(key, value) when is_list(value) or is_map(value) do
    csv = Enum.join(value, ",")
    "#{key}=#{csv}"
  end

  defp stringify(key, value) do
    "#{key}=#{value}"
  end
end
