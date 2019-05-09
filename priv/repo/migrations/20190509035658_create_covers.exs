defmodule Deadlock.Repo.Migrations.CreateCovers do
  use Ecto.Migration

  def change do
    create table("covers") do
      add :code_name, :string, null: false
      add :name, :string, null: true

      timestamps()
    end
  end
end
