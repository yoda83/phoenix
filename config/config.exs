# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fullstacker,
  ecto_repos: [Fullstacker.Repo]

# Configures the endpoint
config :fullstacker, FullstackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S5LGV7o9oDGAXYG3Cw4+aBpb0/Hlim9p5dVrcWT5lK6kYO1ItAtUJro9mt8gBtqV",
  render_errors: [view: FullstackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Fullstacker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
