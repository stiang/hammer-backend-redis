defmodule HammerBackendRedisCluster.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hammer_backend_redis_cluster,
      description: "Redis Cluster backend for Hammer rate-limiter",
      package: [
        name: :hammer_backend_redis_cluster,
        maintainers: ["Stian Grytøyr (stian@grytoyr.net)"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/stiang/hammer-backend-redis-cluster"}
      ],
      source_url: "https://github.com/stiang/hammer-backend-redis-cluster",
      homepage_url: "https://github.com/stiang/hammer-backend-redis-cluster",
      version: "6.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [main: "frontpage", extras: ["doc_src/Frontpage.md"]],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:redix_cluster_remastered, git: "https://github.com/stiang/redix-cluster.git"},
      {:hammer, "6.0.0"},
      {:mock, "~> 0.3.3", only: :test},
      {:ex_doc, "~> 0.16", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.5", only: :test}
    ]
  end
end
