defmodule Offlixir.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/F0lamie/Offlixir"

  def project do
    [
      app: :offlixir,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description:
        "Public holidays of 50 European countries and territories, computed offline with no dependency.",
      package: package(),
      source_url: @source_url,
      docs: docs()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      files: ~w(lib mix.exs README.md LICENSE NOTICE DEVIATIONS.md .formatter.exs)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      extras: ["README.md", "DEVIATIONS.md", "LICENSE", "NOTICE"]
    ]
  end
end
