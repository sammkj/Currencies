defmodule Currencies.Mixfile do
  @moduledoc false

  use Mix.Project

  @source_url "https://github.com/sammkj/Currencies"
  @version "1.0.0"

  def project do
    [
      app: :currencies,
      version: @version,
      elixir: "~> 1.3",
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :jason]]
  end

  defp deps do
    [
      {:jason, "~> 1.2.2"},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end

  def package do
    [
      description:
        "Currencies is a collection of all sorts of useful information for every currency in the ISO 4217 standard.",
      maintainers: ["Kok J Sam"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/sammkj/Currencies"}
    ]
  end
end
