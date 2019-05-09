defmodule Deadlock.SecretAgent do
  use Ecto.Schema

  schema "secret_agents" do
    field :name, :string
    field :disavowed, :boolean

    timestamps()
  end
end
