defmodule PhoenixLiveviewSearch.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :name, :string
      add :body, :string

      timestamps()
    end
  end
end
