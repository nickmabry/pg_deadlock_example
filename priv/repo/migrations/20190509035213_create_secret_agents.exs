defmodule Deadlock.Repo.Migrations.CreateSecretAgents do
  use Ecto.Migration

  def change do
    create table("secret_agents") do
      add :name, :string, null: false
      add :disavowed, :boolean, null: false, default: false

      timestamps()
    end
  end
end
