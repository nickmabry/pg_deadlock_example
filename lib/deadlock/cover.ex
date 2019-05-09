defmodule Deadlock.Cover do
  use Ecto.Schema

  alias Ecto.Changeset
  alias Deadlock.SecretAgent

  schema "covers" do
    field :code_name, :string
    field :name, :string
    field :temp_info, :string

    belongs_to :secret_agent, SecretAgent

    timestamps()
  end

  def changeset(cover, params) do
    Changeset.cast(cover, params, [:code_name, :name])
  end
end
