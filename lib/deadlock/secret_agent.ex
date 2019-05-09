defmodule Deadlock.SecretAgent do
  use Ecto.Schema

  alias __MODULE__
  alias Deadlock.{Cover, Repo}
  alias Ecto.Changeset

  schema "secret_agents" do
    field :name, :string
    field :disavowed, :boolean

    has_many :covers, Cover, on_replace: :delete

    timestamps()
  end

  def changeset(agent, params) do
    Changeset.cast(agent, params, [:name, :disavowed])
    |> Changeset.cast_assoc(:covers)
  end

  def create(params) do
    %SecretAgent{}
    |> changeset(params)
    |> Repo.insert!()
  end

  def update(agent, params) do
    agent
    |> changeset(params)
    |> Repo.update!()
  end
end
