defmodule Deadlock.Repo do
  use Ecto.Repo,
    otp_app: :deadlock,
    adapter: Ecto.Adapters.Postgres
end
