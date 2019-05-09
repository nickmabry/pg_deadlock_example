defmodule Deadlock.Repo.Migrations.AddSecretAgentIDToCovers do
  use Ecto.Migration

  def change do
    alter table("covers") do
      add :secret_agent_id, references("secret_agents", on_delete: :delete_all)
    end
  end
end
