defmodule ChatworkEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :chatwork_ex,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison],
      mod: {ChatworkEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:jason, "~> 1.2"},
      {:httpoison, "~> 1.8"},
      {:exvcr, "~> 0.11", only: :test}
    ]
  end
end
