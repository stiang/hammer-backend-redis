# HammerBackendRedisCluster


A Redis Cluster backend for the [Hammer](https://github.com/ExHammer/hammer) rate-limiter.

## Installation

Hammer-backend-redis-cluster
can be installed by adding `hammer_backend_redis_cluster` to your list of dependencies in `mix.exs`, pointing to the proper GitHub repo:

```elixir
def deps do
  [{:hammer_backend_redis_cluster, git: "https://github.com/stiang/hammer-backend-redis-cluster.git"},
   {:hammer, "~> 6.0"}]
end
```

## Usage

Configure the `:hammer` application to use the Redis backend:

```elixir
config :hammer,
  backend: {Hammer.Backend.RedisCluster, [expiry_ms: 60_000 * 60 * 2,
                                   redix_remastered_config: [host: "localhost",
                                                  port: 6379]]}
```

(the `redix_remastered_config` arg is a keyword-list which is passed to
[RedixRemastered](https://github.com/stiang/redix-cluster), it's also aliased to `redis_remastered_config`,
with an `s`)

And that's it, calls to `Hammer.check_rate/3` and so on will use Redis to store
the rate-limit counters.

See the [Hammer Tutorial](https://hexdocs.pm/hammer/tutorial.html) for more.

## Documentation

On hexdocs (original package): [https://hexdocs.pm/hammer_backend_redis/](https://hexdocs.pm/hammer_backend_redis/)

