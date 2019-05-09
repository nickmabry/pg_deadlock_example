defmodule Deadlock.Repo.Migrations.AddTempFieldToCovers do
  use Ecto.Migration

  def change do
    alter table("covers") do
      add :temp_info, :string, null: true
    end
  end
end
