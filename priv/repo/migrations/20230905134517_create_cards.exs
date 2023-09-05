defmodule PhoenixLiveviewSearch.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string
      add :body, :string

      timestamps()
    end
  end
end
