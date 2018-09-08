defmodule Shopiex.Mixfile do
  use Mix.Project

  @description """
    Simple Elixir wrapper for the Shopify API
  """

  def project do
    [
      app: :shopiex,
      version: "0.1.0",
      elixir: "~> 1.5",
      name: "Shopiex",
      description: @description,
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test],
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:tesla, "1.0.0-beta.1"},
      {:earmark, "~> 0.2.1", only: :dev},
      {:ex_doc, "~> 0.11.4", only: :dev},
      {:inch_ex, "~> 0.5", only: :dev},
      {:excoveralls, "~> 0.5", only: :test},
      {:exvcr, "~> 0.9.1", only: :test},
      {:meck, "~> 0.8.9", only: :test}
    ]
  end

  defp package do
    [
      maintainers: ["Jordan Parker"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/byjord/shopiex"}
    ]
  end
end
