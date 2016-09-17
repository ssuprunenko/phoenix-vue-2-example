defmodule Web.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :host, :string
      add :path, :string

      timestamps()
    end

  end
end
