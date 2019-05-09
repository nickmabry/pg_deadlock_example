use Mix.Config

# Configure your database
config :deadlock, Deadlock.Repo,
  username: "postgres",
  password: "postgres",
  database: "deadlock_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :deadlock, DeadlockWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
