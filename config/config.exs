# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tailwindgen,
  ecto_repos: [Tailwindgen.Repo]

# Configures the endpoint
config :tailwindgen, TailwindgenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yv898rWMexiNqntIRJ+YhS0vsBXGiyJmGSu2jUwlhWhreRYHotsCPtYNSLTjdeL5",
  render_errors: [view: TailwindgenWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tailwindgen.PubSub,
  live_view: [signing_salt: "CUaoAVdS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
#
#
config :kaffy,
  otp_app: :tailwindgen,
  ecto_repo: Tailwindgen.Repo,
  router: TailwindgenWeb.Router
import_config "#{Mix.env()}.exs"
