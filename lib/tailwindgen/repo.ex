defmodule Tailwindgen.Repo do
  use Ecto.Repo,
    otp_app: :tailwindgen,
    adapter: Ecto.Adapters.Postgres
end
