defmodule Offlixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :offlixir,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: []
    ]
  end

  def application do
    []
  end
end
