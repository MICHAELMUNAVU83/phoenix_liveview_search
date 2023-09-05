defmodule PhoenixLiveviewSearch.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :name, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
